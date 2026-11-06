import { z } from "zod";
import { MemberRole } from "./enums.js";
import { emailField, idField } from "./fields.js";

// TYPE-17（项目名上限 100，假设值）；API-32
export const CreateProjectRequest = z.strictObject({
  name: z.string().trim().min(1).max(100),
});
export type CreateProjectRequest = z.infer<typeof CreateProjectRequest>;

// TYPE-6、TYPE-7（两种角色同形）；API-34
export const Project = z.object({
  id: idField,
  name: z.string(),
  role: MemberRole,
});
export type Project = z.infer<typeof Project>;

// TYPE-18（items）；API-18；API-30 补充
export const ListProjectsResponse = z.object({
  items: z.array(Project),
});
export type ListProjectsResponse = z.infer<typeof ListProjectsResponse>;

// TYPE-17；PRD 审定决策 D5、D10（不带角色）
export const CreateMemberRequest = z.strictObject({
  email: emailField,
});
export type CreateMemberRequest = z.infer<typeof CreateMemberRequest>;

// API-59（用户 id）；TYPE-11、TYPE-15；PRD 澄清注记 4（显示邮箱）
export const Member = z.object({
  userId: idField,
  email: z.string(),
  role: MemberRole,
});
export type Member = z.infer<typeof Member>;

// TYPE-18（items）；API-18；API-59
export const ListMembersResponse = z.object({
  items: z.array(Member),
});
export type ListMembersResponse = z.infer<typeof ListMembersResponse>;

// API-36、API-57 修订（userId，不包数组）
export const ReplaceProjectOwnerRequest = z.strictObject({
  userId: idField,
});
export type ReplaceProjectOwnerRequest = z.infer<typeof ReplaceProjectOwnerRequest>;
