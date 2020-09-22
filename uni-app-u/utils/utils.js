//工具的js文件
//检测是否登录
const _checkToken=async (_this,token)=>{
	//token不存在
	if(!token){
		uni.setTabBarItem({
			index:2,
			text:'未登录'
		})
		return false;//false--表示未登录的
	}
	
	//token存在
	let result=await _this.api._checkToken({"authorization":token});
	if(result.data.code==200){
		uni.setTabBarItem({
			index:2,
			text:"我的"
		})
		return  true;//true--表示已登录
	}else{
		uni.clearStorageSync();//token--过期--要删除所有的缓存
		uni.setTabBarItem({
			index:2,
			text:'未登录'
		})
		return false;//false--返回未登录状态
	}
}

export  default  _checkToken;