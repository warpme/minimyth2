include ../category.mk

clean-all:
	@$(foreach dir, $(wildcard ../nvidia-*), $(MAKE) clean clean-all -C $(dir) ; )
