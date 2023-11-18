const path = require("path");
// change node_modules path if necessary
// this can be found with > npm list -g
const sharp = require("/opt/homebrew/lib/node_modules/sharp");

const files = process.argv[2].split(",");

files.forEach(async (file) => {
  const dir = path.parse(file).dir;
  const name = path.parse(file).name;

  await sharp(file)
    .webp({ quality: 90 })
    .toFile(path.join(dir, name + ".webp"));
});

process.exit(0);
