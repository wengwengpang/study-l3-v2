import { z } from "zod";

// TYPE-16、TYPE-24、API-24、API-47：12 个 urn 加 about:blank；性质名小写加连字符
export const ProblemType = z.enum([
  "about:blank",
  "urn:study-l3-v2:problem:unauthenticated",
  "urn:study-l3-v2:problem:not-found",
  "urn:study-l3-v2:problem:forbidden",
  "urn:study-l3-v2:problem:csrf-rejected",
  "urn:study-l3-v2:problem:invalid-request",
  "urn:study-l3-v2:problem:conflict",
  "urn:study-l3-v2:problem:unsupported-media-type",
  "urn:study-l3-v2:problem:internal-error",
  "urn:study-l3-v2:problem:email-already-used",
  "urn:study-l3-v2:problem:invitee-not-registered",
  "urn:study-l3-v2:problem:already-member",
  "urn:study-l3-v2:problem:sole-owner-removal",
]);
export type ProblemType = z.infer<typeof ProblemType>;

// TYPE-16（type、title、status、instance 必填，detail 可省）；API-17；API-51 第一点
export const ProblemDetails = z.object({
  type: ProblemType,
  title: z.string(),
  status: z.int(),
  detail: z.string().optional(),
  instance: z.string(),
});
export type ProblemDetails = z.infer<typeof ProblemDetails>;

// TYPE-16（errors、detail、pointer）；TYPE-21（查询参数项与收窄）；API-31；API-56
export const ValidationProblemDetails = ProblemDetails.extend({
  status: z.literal(400),
  errors: z
    .array(
      z.union([
        z.object({ detail: z.string(), pointer: z.string() }),
        z.object({ detail: z.string(), parameter: z.string() }),
      ]),
    )
    .min(1),
});
export type ValidationProblemDetails = z.infer<typeof ValidationProblemDetails>;
