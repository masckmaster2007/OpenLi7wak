const base64 = require('base64-js');

function xorCipher(string, key) {
  return [...string]
    .map((char, index) => String.fromCharCode(char.charCodeAt(0) ^ key.charCodeAt(index % key.length)))
    .join('');
}

function encodeGJP(password) {
  const encoded = xorCipher(password, '37526');
  const encodedBase64 = base64.fromByteArray(Buffer.from(encoded));
  const modifiedBase64 = encodedBase64.replace(/\+/g, '-').replace(/\//g, '_');
  return modifiedBase64;
}

if (require.main === module) {
  if (process.argv.length > 2) {
    const text = process.argv[2];
    const gjp = encodeGJP(text);
    console.log(gjp);
  } else {
    console.log('Please provide a password...');
  }
}
