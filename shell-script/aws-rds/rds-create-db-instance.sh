aws rds create-db-instance	\
	--db-name meuDB \
	--db-instance-identifier our-db-instance \
	--allocated-storage 5 \
	--db-instance-class db.t1.micro \
	--engine MySQL	\
	--master-username dbmaster \
	--master-user-password password

aws rds describe-db-instances
	
