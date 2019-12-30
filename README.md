# Share
资料分享

新建项目上传到git步骤

1、使用cd命令切换到项目目录，通过git init把它变成Git仓库，再通过git add .把项目添加到仓库；

2、再通过git commit -m "注释内容"把项目提交到仓库"；

3、在Github上设置好SSH密钥后，新建一个远程仓库，通过git remote add origin https://github.com/Dozen729/W...（这里为你的git项目的地址）；

4、最后通过git push -u origin master把本地仓库的项目推送到远程仓库（也就是Github）上；

由于新建的远程仓库是空的，所以要加上-u这个参数

5、此时执行第5点命令可能会报如下错误：
```
! [rejected] master -> master (fetch first)
error: failed to push some refs to 'https://github.com/shut-up/re...'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```
那是因为远程仓库与本地仓库不一致，导致错误，此时需要先git pull使远程仓库与本地仓库合并

7、此时git pull也会出现如下错误，
```
There is no tracking information for the current bran
Please specify which branch you want to merge with.
See git-pull(1) for details.
git pull <remote> <branch>
If you wish to set tracking information for this branch you can do so with:
git branch --set-upstream-to=origin/<branch> master
```
因为本地仓库没有与远程仓库进行关联，需要执行命令git branch --set-upstream-to=origin/master master

8、此时再执行git pull命令，再执行git push -u origin master就可以上传成功了。

如果git pull报错，fatal: refusing to merge unrelated histories，是因为两个根本不相干的 git 库， 一个是本地库， 一个是远端库， 然后本地要去推送到远端， 远端觉得这个本地库跟自己不相干， 所以告知无法合并。
可通过一下命令强制合并：

git pull origin master --allow-unrelated-histories
