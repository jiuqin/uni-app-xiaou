// 公共模块

// 服务器地址
// let baseUrl  = "http://localhost:3000";
// 生产环境（线上） http://m.api.com
// 开发环境    http://locahost:3000.com
let  baseUrl = null; //存储服务器地址

if(process.env.NODE_ENV === "development"){
	// 开发环境
	baseUrl = "http://localhost:3000";
}else{
	baseUrl = "http://m.api.com"
}

export default  baseUrl;