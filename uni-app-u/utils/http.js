// 封装网络请求
import  BaseUrl  from "./config.js";
const  http = (options)=>{
	// options = { url  data  method  header   }
	return new Promise((resolve,reject)=>{
		uni.request({
			url:BaseUrl + options.url,
			data:options.data || {},
			method:options.method || "get",
			header:options.header || {
				"content-type":"application/json"
			},
			success:resolve,
			fail:reject
		})
	})
}
export default http;