/** @type {import('tailwindcss').Config} */
export default {
  content: ["./index.html", "./src/**/*.{js,jsx}"],
  theme: {
    extend: {
      colors: {
        // Token ARTVAULT — pakai ini, jangan tulis hex langsung di komponen baru.
        merah:        "#E81E28",
        "merah-aksen":  "#C41A22",
        "merah-pressed":"#A9161D",
        "merah-tint":   "#FEF2F3",
        tinta:        "#0A0A0B",
        abu:          "#52525B",
        "abu-muted":  "#A1A1AA",
        permukaan:    "#F5F5F5",
        isian:        "#F4F4F5",
        hairline:     "#E5E5E7",
        "border-muted": "#D4D4D8",
        sukses:       "#059669",
        peringatan:   "#F59E0B",
      },
      fontFamily: { sans: ["'Plus Jakarta Sans'", "Inter", "system-ui", "sans-serif"] },
    },
  },
  plugins: [],
};
