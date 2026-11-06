import { z } from "zod";
import { emailField, idField, withinEmailBytes } from "./fields.js";

// API-34、API-53（三处同形）；TYPE-9（没声明的字段丢掉）
export const User = z.object({
  id: idField,
  email: z.string(),
});
export type User = z.infer<typeof User>;

// TYPE-10、TYPE-17；PRD 审定决策 D20；API-32 补充（密码不 trim）
export const CreateUserRequest = z.strictObject({
  email: emailField,
  password: z.string().min(15).max(64),
});
export type CreateUserRequest = z.infer<typeof CreateUserRequest>;

// TYPE-14（不套注册规则，空值回 400）；TYPE-21、TYPE-23（上限 254 字节，不校格式）
export const CreateSessionRequest = z.strictObject({
  email: z.string().trim().min(1).refine(withinEmailBytes),
  password: z.string().min(1).max(64),
});
export type CreateSessionRequest = z.infer<typeof CreateSessionRequest>;
