#encoding = utf-8
class AndroidController < ApplicationController

	def login
		number=params[:number]
		pw=params[:password]
		password=Digest::MD5.hexdigest(pw)
		m=Student.where("number"=>number,"password"=>password).first
		if(m==nil)
			str={"status"=>100}
		else
			str={"token"=>m.token,"status"=>200}
		end
		render:json=>str
	end
		
	def getnotice
                msg=Notice.all
                content=[]
                for i in msg do
                        str={"title"=>i.title,"content"=>i.content,"id"=>i.id}
                        content<<str
                end
                render:json=>content
        end
end
