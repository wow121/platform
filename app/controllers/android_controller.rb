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
                        str={"title"=>i.title,"content"=>i.content,"id"=>i.id,"time"=>i.created_at.to_i*1000}
                        content<<str
                end
                render:json=>content
    end

    def getuserinf
    	token=params[:token]
    	user=Student.where("token"=>token).first

    	render:json=>{"number"=>user.number,"name"=>user.name,"sex"=>user.sex,"grade"=>user.grade,"major"=>user.major,"myclass"=>user.myclass}
    end

    def changepassword
    	number=params[:number]
    	pw=params[:oldpassword]
    	newpw=params[:newpassword]
    	password=Digest::MD5.hexdigest(pw)
    	m=Student.where("number"=>number,"password"=>password).first
    	if(m==nil)
			str={"status"=>100}
		else
			password=Digest::MD5.hexdigest(newpw)
			m.password=password
			m.save
			str={"token"=>m.token,"status"=>200}
		end
		render:json=>str
    end

    def getscore
    	token=params[:token]
    	user=Student.where("token"=>token).first
    	score=Score.where("name"=>user.name)
    	content=[]
    	for i in score do
    		str={"specialized"=>i.specialized,"score"=>i.score}
    		content<<str
    	end
    	render:json=>content
    end

    def getsyllabus
    	token=params[:token]
    	user=Student.where("token"=>token).first
    	myclass=Myclass.where("name"=>user.myclass).first
    	syllabus=myclass.curriculum.split(/,/)
    	content=[]
    	for i in syllabus do
    		specialized=Specialized.find(i.to_i)
    		str={"name"=>specialized.name,"teacher"=>specialized.teacher,"period"=>specialized.period,"location"=>specialized.location,"time"=>specialized.time}
    		content<<str
    	end
    	render:json=>content
    end

    def setfeedback
        token=params[:token]
        content=params[:content]
        user=Student.where("token"=>token).first
        Feedback.create({"number"=>user.number,"content"=>content})
        str={"status"=>200}
        render:json=>str
    end
end
