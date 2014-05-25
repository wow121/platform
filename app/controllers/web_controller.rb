#encoding = utf-8
class WebController < ApplicationController
	
	 def login
                name=params[:name]
                pw=params[:password]
                password=Digest::MD5.hexdigest(pw)
                m=Student.where("name"=>name,"password"=>password).first
                if(m==nil)
                        str={"status"=>100}
                else
                        str={"token"=>m.token,"status"=>200}
                end
                render:json=>str
        end


	def register
        name=params[:name]
        pw=params[:password]
        number=params[:number]
        grade=params[:grade]
        myclass=params[:myclass]
        password=Digest::MD5.hexdigest(pw)
        code=AndroidHelper.mkrandom(12)
        str=nil
        m=Student.where("number"=>number).first
        if(m==nil)
        	user=Student.new
        	user.name=name
        	user.password=password
        	user.number=number
        	user.grade=grade
        	user.token=code
        	user.myclass=myclass
        	user.save
        	str={"token"=>code,"status"=>200}
        else
        	str={"status"=>100}
        end
			render:json=>str
    end

    def addstudent
    	name=params[:name]
    	number=params[:number]
    	grade=params[:grade]
    	myclass=params[:myclass]
    	sex=params[:sex]
    	major=params[:major]

    	password=number[number.length-6,number.length]
    	password=Digest::MD5.hexdigest(password)
    	code=AndroidHelper.mkrandom(12)
    	str=nil
        m=Student.where("number"=>number).first
                if(m==nil)
                        user=Student.new
                        user.name=name
                        user.password=password
                        user.number=number
                        user.grade=grade
                        user.token=code
                        user.sex=sex
                        user.myclass=myclass
                        user.major=major
                        user.save
                        str={"token"=>code,"status"=>200}
                else
                        str={"status"=>100}
                end
		render:json=>str
    end


    def getstudent
    	stu=Student.all
    	content=[]
    	for i in stu do
    		str={"name"=>i.name,"number"=>i.number,"grade"=>i.grade,"myclass"=>i.myclass,"sex"=>i.sex.to_i,"major"=>i.major,"id"=>i.id}
    		content<<str
    	end
    	render:json=>content
    end
	
	def uploadstudent
		id=params[:id].to_i
		name=params[:name]
    	number=params[:number]
    	grade=params[:grade]
    	myclass=params[:myclass]
    	sex=params[:sex]
    	major=params[:major]
	 	user=Student.find(id)
	 	user.name=name
        user.number=number
        user.grade=grade
        user.sex=sex
        user.myclass=myclass
        user.major=major
        user.save
        str={"status"=>200}
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
                        str={"name"=>name,"status"=>200}
		 else
			 str={"status"=>100}
		 end
		 render:json=>str
	end

	def getspecialized
		spe=Specialized.all
		content=[]
		for i in spe do
			str={"name"=>i.name,"teacher"=>i.teacher,"intro"=>i.intro,"period"=>i.period,"location"=>i.location,"id"=>i.id}
			content<<str
		end
		render:json=>content
	end

	def addclass
		name=params[:name]
		count=params[:count]
		teacher=params[:teacher]
		grade=params[:grade]
		str=nil
		cla=Myclass.where("name"=>name).first
		if(cla==nil)
			cla=Myclass.new
			cal.name=name
			cal.count=count
			cal.teachermanage=teacher
			cal.grade=grade
			cal.save
			str={"name"=>name,"status"=>200}
		else
			str={"status"=>100}
		end
		render:json=>str
	end

	def setcurriculum
		name=params[:name]
		str=params[:str]
		my=Myclass.where("name"=>name).first
		if(my==nil)
			str={"status"=>100}
		else
			my.curriculum=str
			my.save
			str={"status"=>200}
		end
	end

	

	
	def addnotice

		 title=params[:title]
                 content=params[:content]
		 msg=Notice.new
		 msg.title=title
		 msg.content=content
		 msg.save
	 	 str={"status"=>200}
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

	def rmnotice
		id=params[:id].to_i
		Notice.delete(id)
		str={"status"=>200}
		render:json=>str
	end
	
	def uploadnotice
		id=params[:id].to_i
		title=params[:title]
        content=params[:content]
		msg=Notice.find(id)
		msg.title=title
		msg.content=content
		msg.save
		str={"status"=>200}
                render:json=>str
	end

	def getfeedback
		msg=Feedback.all
		content=[]
		for i in msg do
			str={"number"=>i.number,"content"=>i.content,"id"=>i.id}
			content<<str
		end
		render:json=>content
	end

	def delfeedback
		id=params[:id]
		Feedback.delete(id)
		str={"status"=>200}
		render:json=>str
	end
end
