#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Developer");
MODULE_DESCRIPTION("A Simple Test Kernel Module");
MODULE_VERSION("1.0");

static int __init test_init(void) {
    printk(KERN_INFO "test: Hello, Kernel!\n");
    return 0;
}

static void __exit test_exit(void) {
    printk(KERN_INFO "test: Goodbye, Kernel!\n");
}

module_init(test_init);
module_exit(test_exit);