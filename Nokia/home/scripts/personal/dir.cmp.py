from filecmp import dircmp
def print_diff_files(dcmp):
    for name in dcmp.diff_files:
        print "diff_file %s found in %s and %s" % (name, dcmp.left,
              dcmp.right)
    for sub_dcmp in dcmp.subdirs.values():
        print_diff_files(sub_dcmp)

dcmp = dircmp('/home/arunsr/', '/home/arunsr/MyGitEnv/My_Work_Env/Nokia/home/')
print_diff_files(dcmp)

