import { z } from "zod";
import { TaskStatus } from "./enums.js";
import { idField } from "./fields.js";

// 文件内片段，不导出：TYPE-17（先 trim 再判长度，上限是假设值）
const titleField = z.string().trim().min(1).max(200);
const descriptionField = z.string().trim().min(1).max(5000);
// 文件内片段，不导出：TYPE-17（只校合法日期，不限过去）；API-41
const dueDateField = z.iso.date();

// API-54（没传与 null 同义）；API-31、决策 D（项目只从路径取）
export const CreateTaskRequest = z.strictObject({
  title: titleField,
  description: descriptionField,
  assigneeUserId: idField.nullable().optional(),
  dueDate: dueDateField.nullable().optional(),
});
export type CreateTaskRequest = z.infer<typeof CreateTaskRequest>;

// API-33、API-35（没传不改，null 清空，不收状态）；TYPE-17（空对象回 200）
export const UpdateTaskRequest = z.strictObject({
  title: titleField.optional(),
  description: descriptionField.optional(),
  assigneeUserId: idField.nullable().optional(),
  dueDate: dueDateField.nullable().optional(),
});
export type UpdateTaskRequest = z.infer<typeof UpdateTaskRequest>;

// API-35；TYPE-17（必须带状态）
export const UpdateTaskStatusRequest = z.strictObject({
  status: TaskStatus,
});
export type UpdateTaskStatusRequest = z.infer<typeof UpdateTaskStatusRequest>;

// 内部形状（TYPE-8，不进契约）；TYPE-11；TYPE-18（任务负责人是子对象，未分配为 null）
export const ExecutorTask = z.object({
  id: idField,
  title: z.string(),
  description: z.string(),
  status: TaskStatus,
  assignee: z.object({ id: idField, email: z.string() }).nullable(),
  dueDate: dueDateField.nullable(),
});
export type ExecutorTask = z.infer<typeof ExecutorTask>;

// 内部形状（TYPE-8，不进契约）；API-43；PRD 审定决策 D13
export const OwnerTask = ExecutorTask.extend({
  possiblyStuck: z.boolean(),
});
export type OwnerTask = z.infer<typeof OwnerTask>;

// TYPE-8（负责人形状排在前面）；API-30 补充
export const Task = z.union([OwnerTask, ExecutorTask]);
export type Task = z.infer<typeof Task>;

// TYPE-18（items）；API-18；API-43
export const ListTasksResponse = z.object({
  items: z.array(Task),
});
export type ListTasksResponse = z.infer<typeof ListTasksResponse>;

// API-42 补充（四个数，不带完成率）；US-04
export const ProjectSummary = z.object({
  total: z.int().min(0),
  completed: z.int().min(0),
  inProgress: z.int().min(0),
  notStarted: z.int().min(0),
});
export type ProjectSummary = z.infer<typeof ProjectSummary>;
