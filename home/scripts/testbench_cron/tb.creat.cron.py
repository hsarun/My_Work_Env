from crontab import CronTab

cron = CronTab(user='arunsr')
job = cron.new(command='python ~/scripts/testbench_cron/example1.py')
#job.minute.every(1)
job.day.every(1)

print "items in cron:"
for item in cron:
    print item

#job.clear()

#for item in cron:
#    print item

cron.write()
print "Job created"

#print job.enable()
#print job.enable(False)


# list all cron jobs (including disabled ones)
print "jobs in cron:"
for job in cron:
    print job

print "items in cron:"
for item in cron:
    print item

#cron.remove(job)
cron.remove_all()
print "Job removed?"

print "items in cron:"
for item in cron:
    print item

# list all cron jobs (including disabled ones)
print "jobs in cron:"
for job in cron:
    print job

