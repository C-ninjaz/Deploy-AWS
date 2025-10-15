import server from "./app.js";
import { PORT } from "./solution.js";

server.listen(PORT, "0.0.0.0", () => {
  console.log(`server is running on port ${PORT}`);
});
