const fs = require('node:fs');
const path = require('node:path');

const root = path.resolve(__dirname, '..');
const output = path.join(root, 'www');
const required = ['index.html', 'config.js'];

fs.mkdirSync(output, { recursive: true });
for (const file of required) {
  const source = path.join(root, file);
  if (!fs.existsSync(source)) {
    throw new Error(`Required FINANCEVERSE file is missing: ${file}`);
  }
  fs.copyFileSync(source, path.join(output, file));
}
console.log('FINANCEVERSE mobile web bundle prepared in ./www');
