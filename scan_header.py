#coding=utf-8

# 进入脚本目录，执行 $ python scan_header.py

import os

# 扫面 UI SDK 的代码，保证其引入的各个 SDK 头文件同时支持 <> "" 两种引入方式
# 原理为文本扫描代码文件，文件有 <> 则 +1 有对应的 "" 则 -1，如果结果 > 0 ，则说明非法

check_map = {}
check_map['<RongIMKit/RongIMKit.h>'] = 'RongIMKit.h'
check_map['<RongSticker/RongSticker.h>'] = 'RongSticker.h'
check_map['<RongSight/RongSight.h>'] = 'RongSight.h'
check_map['<RongContactCard/RongContactCard.h>'] = 'RongContactCard.h'
check_map['<RongCallKit/RongCallKit.h>'] = 'RongCallKit.h'

# black_list_path 不扫描
black_list_path_set = [".git","bin","bim_tmp","build","framework","DerivedData","RCloudMessage",]

error_map = {}

def _check_one(file_path):
	global error_map

	f = open(file_path)
	lines = f.readlines()
	f.close()

	print("开始扫描 %s " % file_path)

	for key,value in check_map.items():
		flag = 0
		for l in lines:
			# print(l)

			# __has_include(<RongIMKit/RongIMKit.h>) 需要排除干扰
			if(l.find("__has_include") >= 0):
				continue

			#命中 <> 则 +1 如果命中 "" 则 -1 如果不合法，最终结果为 > 0 ；否则合法
			if(l.find(key) >= 0):
				flag = flag + 1
			elif(l.find(value) >= 0):
				flag = flag - 1

		#
		if(flag > 0):
			print("失败 %s" % file_path)
			error_map[file_path] = key
		else:
			print("成功 %s" % file_path)

def scan_all_file():
	for root,dirs,files in os.walk("./"):
		for f in files:

			# 黑名单内部的路径不用扫描，如编译缓存 sealtalk 等
			in_black_list = 0
			for black_list in black_list_path_set:
				# print("root %s" % root)
				# print("black_list %s" % black_list)
				if(root.find(black_list) >= 0):
					print("%s 在黑名单 %s 中，不再扫描该目录" %(root,black_list))
					in_black_list = 1

			if(in_black_list == 1):
				continue

			if(f.endswith(".h") or f.endswith(".m") or f.endswith(".mm") ):
				path = os.path.join(root,f)
				_check_one(path)
				# print(path)

def print_info():
	print("检测规则如下，代码需要保证出现如果出现 key 则必须出现对应的 value")
	print(check_map)
	print

def gen_result():

	print("\n\n==扫描结果==")
	if(len(error_map) <= 0):
		print("所有代码符合规范")
		return

	with open("error_header.txt","w+") as f:
		for key,value in error_map.items():
			info = '[ERROR] '+key+' : '+value +' 无法配对 <> ""\n\n'
			f.write(info)
			print(info)


def main():

	print_info()
	scan_all_file()
	gen_result()


if __name__ == '__main__':

	pwd = os.getcwd()
	print("当前路径是脚本目录 %s" % pwd)
	os.chdir("../../")
	pwd = os.getcwd()
	print("切换到项目根目录 %s" % pwd)
	
	print("开始扫描")
	main()

