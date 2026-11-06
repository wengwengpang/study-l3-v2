import { z } from "zod";

// TYPE-19；ARCHITECTURE 第二节「共享层边界」
export const MemberRole = z.enum(["OWNER", "EXECUTOR"]);
export type MemberRole = z.infer<typeof MemberRole>;

// TYPE-19；PRD 审定决策 D12
export const TaskStatus = z.enum(["NOT_STARTED", "IN_PROGRESS", "COMPLETED"]);
export type TaskStatus = z.infer<typeof TaskStatus>;
