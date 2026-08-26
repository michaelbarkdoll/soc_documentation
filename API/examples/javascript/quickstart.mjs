const nodeMajor = Number.parseInt(process.versions.node.split(".")[0], 10);
if (nodeMajor < 22) {
  console.error(
    `Node.js 22 or newer is required. Detected ${process.version}. Upgrade Node.js, then run npm install again.`
  );
  process.exit(1);
}

const { default: OpenAI } = await import("openai");

function requiredEnv(name) {
  const value = process.env[name];
  if (!value) throw new Error(`Set ${name} before running this program.`);
  return value;
}

const client = new OpenAI({
  baseURL: process.env.SIU_AI_BASE_URL ?? "https://api.cs.siu.edu/v1",
  apiKey: requiredEnv("SIU_AI_KEY"),
  timeout: 120_000,
  maxRetries: 2,
});

try {
  const response = await client.chat.completions.create({
    model: requiredEnv("SIU_AI_MODEL"),
    messages: [
      {
        role: "system",
        content: "You are a careful programming tutor. Explain your assumptions.",
      },
      {
        role: "user",
        content: "Explain async/await in JavaScript with one small example.",
      },
    ],
    temperature: 0.2,
  });
  console.log(response.choices[0]?.message?.content ?? "");
} catch (error) {
  console.error("SIU AI request failed:", error?.message ?? error);
  process.exitCode = 1;
}
