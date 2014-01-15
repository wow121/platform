#encoding = utf-8
class WebController < ApplicationController
	def register
                name=params[:name]
                pw=params[:password]
                number=params[:number]
                grade=params[:grade]
                myclass=params[:myclass]
                password=Digest::MD5.hexdigest(pw)
                code=AndroidHelper.mkrandom(12)
                str=nil
                m=Student.where("name"=>name).first
                if(m==nil)
                        user=Student.new
                        user.name=name
                        user.password=password
                        user.number=number
                        user.grade=grade
                        user.token=code
                        user.myclass=myclass
                        user.save
                        str={"token"=>code,"success"=>200}
                else
                        str={"fail"=>"username is used"}
                end
		render:json=>str
        end
	
	def addspecialized
		 name=params[:name]
		 teacher=params[:teacher]
		 intro=params[:intro]
		 period=params[:period]
		 location=params[:location]
		str=nil
                m=Specialized.where("name"=>name).first
		 if(m==nil)
                        user=Specialized.new
                        user.name=name
                        user.teacher=teacher
                        user.intro=intro
                        user.period=period
                        user.location=location
                        user.save
                        str={"name"=>name,"success"=>200}
		else
			 str={"fail"=>"name is used"}
		end
		render:json=>str
	end
end
