
const input = "cxdnnyjw";
// const input = "abc";
const crypto = require('crypto');

let index = 0;
let password = [];
let hash;

while (password.length < 8 ) {
	index = index + 1;
	hash = crypto.createHash('md5').update(input + index).digest("hex");

	if (hash.substring(0,5) == "00000") {
		password.push(hash.substring(5,6));
	}
}

console.log(password.join(""));
