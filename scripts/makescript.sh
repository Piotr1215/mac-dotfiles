grep -rl 'FMC' ./cnp | xargs sed -i '' 's/FMC/platform/g'
grep -rl 'Piotr.Zaniewski@fmc-ag.com' ./cnp | xargs sed -i '' 's/Piotr.Zaniewski@fmc-ag.com/p.zaniewski@platform.com/g'
