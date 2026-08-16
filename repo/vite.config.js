import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

// base harus cocok dengan nama repo supaya GitHub Pages menemukan asetnya.
export default defineConfig({
  plugins: [react()],
  base: process.env.GITHUB_PAGES ? "/project/" : "/",
});
