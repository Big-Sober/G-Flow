# G-Flow: Hyper-Lapse G-Code Terminal

![License](https://img.shields.io/badge/license-MIT-green)
![Version](https://img.shields.io/badge/version-1.0.0-00ff41)

G-Flow is a high-performance, web-based G-code visualizer designed with a gritty cyberpunk aesthetic. It transforms boring 3D printing instructions into a cinematic "Hyper-Lapse" experience, allowing creators to preview, record, and share their print paths in style.

[Live Demo](https://3dp.ing) ## ✨ Key Features

- **Cyberpunk HUD:** A Matrix-inspired interface showing real-time nozzle temperature, Z-height, and command streams.
- **Hyper-Lapse Simulation:** Experience the print path at extreme speeds with dynamic acceleration.
- **Advanced Visualization:**
    - **Imprint Mode:** Leave a glowing trail of the print path.
    - **Travel Toggle:** Show or hide non-extruding movements.
    - **3D Orbit:** Full 360° rotation and pitch control to inspect models from any angle.
- **Direct Export:** Capture high-resolution screenshots (SHOT) or record WebM video (REC) directly from your browser.
- **File Support:** Handles standard `.gcode` and Bambu Lab/Prusa style `.gcode.3mf` files.

## 🚀 Quick Start

Since G-Flow is built with vanilla HTML5/JavaScript, no installation is required.

1. Clone the repository:
   ```bash
   git clone [https://github.com/bigchx/g-flow.git](https://github.com/bigchx/g-flow.git)

   
2. Open index.html in any modern web browser.

3. Drag & Drop your G-code file onto the terminal or use the [ + LOAD GCODE ] button.


📦 Tech Stack
Frontend: HTML5, CSS3, Vanilla JavaScript.

Graphics: HTML5 Canvas (2D Context with projection logic).

Libraries: JSZip (for .3mf parsing).

🤝 Contribution
Contributions are welcome! Whether it's adding new visual themes, optimizing the G-code parser, or improving 3D projection, feel free to open an issue or submit a pull request.

📜 License
This project is licensed under the MIT License - see the LICENSE file for details.

Created by Big Plate Chicken Team (@bigchx)


### C. LICENSE (MIT 许可证)

```text
MIT License

Copyright (c) 2026 Big Plate Chicken Team

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.