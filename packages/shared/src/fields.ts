import { z } from "zod";

// 内部片段，不是契约名字（TYPE-18）；列是 32 位 Int，超范围挡在 400（TYPE-21）
export const idField = z.int32().positive();

// TYPE-23：邮箱上限按 UTF-8 字节算，注册、邀请、登录共用
export const withinEmailBytes = (s: string) => new TextEncoder().encode(s).length <= 254;

// TYPE-17、TYPE-23：先 trim，再判格式与字节上限，预设 unicodeEmail
export const emailField = z.string().trim().regex(z.regexes.unicodeEmail).refine(withinEmailBytes);
