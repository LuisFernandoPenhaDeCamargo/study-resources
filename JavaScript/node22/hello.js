console.log("-----");

console.log("process.execPath:", process.execPath);

console.log("-----");

const { createRequire } = require("node:module");

require = createRequire(__filename);

console.log("require:", require);

const objetoImportado = require("./asset");

console.log("objetoImportado:", objetoImportado);

console.log("-----");

const { getAsset, getRawAsset, getAssetAsBlob } = require("node:sea");

const ValueGetAsset = getAsset("assetJS");

console.log("getAsset:", ValueGetAsset);

const ValueUtf8GetAsset = getAsset("assetJS", "utf8");

console.log("getAssetUtf8:", ValueUtf8GetAsset);

const ValuegetRawAsset = getRawAsset("assetJS");

console.log("getRawAsset:", ValuegetRawAsset);

const ValuegetAssetAsBlob = getAssetAsBlob("assetJS");

console.log("getAssetAsBlob:", ValuegetAssetAsBlob);

console.log("-----");

console.log("hello.js.");