
const input = "cxdnnyjw";
// const input = "abc";
const crypto = require('crypto');

let index = 0;
let password = [];
let hash;

while (password.join("").length < 8 ) {
	index = index + 1;
	hash = crypto.createHash('md5').update(input + index).digest("hex");

	if (hash.substring(0,5) == "00000" && hash.substring(5,6) < 8 && !password[hash.substring(5,6)]) {
		password[hash.substring(5,6)] = hash.substring(6,7);
		console.log(hash);
		console.log(password);
	}
}

console.log(password.join(""));
