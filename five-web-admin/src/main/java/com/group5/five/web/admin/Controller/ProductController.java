package com.group5.five.web.admin.Controller;

import com.group5.five.web.admin.service.ProductService;
import com.group5.five.web.admin.utils.BaseResult;
import com.group5.five.web.admin.utils.PageInfo;
import com.group5.five.web.domain.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("product")
public class ProductController {
    @Autowired
    ProductService service;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String list() {
        return "product_list";
    }


    @ResponseBody
    @RequestMapping(value = "page", method = RequestMethod.GET)
    public PageInfo<Product> page(int draw, int start, int length, Product product) {
        System.out.println(product);
        PageInfo<Product> pageInfo = service.page(draw, start, length, product);
        return pageInfo;
    }

    @ModelAttribute
    public Product getTbContent(Long productId){

        Product product = new Product();
        if(productId!=null){
            product =  service.getTbProductById(productId);
        }

        return product;
    }


    @RequestMapping(value="form",method = RequestMethod.GET)
    public String form(){

        return "product_form";
    }


    @RequestMapping(value="save",method = RequestMethod.POST)
    public String save(Product product, RedirectAttributes redirectAttributes, Model model){
        BaseResult baseResult = service.save(product);
        if(baseResult.getStatus()==BaseResult.STATUS_SUCCESS){
            //如果表单验证通过了,把封装了具体状态码和信息的baseResult对象转递到目标页面
            redirectAttributes.addFlashAttribute("baseResult",baseResult);
            return "redirect:/product/list";
        }
        else{
            //如果表单验证没有通过
            //返回错误信息，并且回到新增页面
            model.addAttribute("baseResult",baseResult);
            return "product_form";
        }
    }



    /**
     * 批量删除
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value="deletemulti",method = RequestMethod.POST)
    public BaseResult deletemulti(String ids){
        BaseResult baseResult = service.deleteProduct(ids);
        return baseResult;
    }


    @RequestMapping(value="detail",method = RequestMethod.GET)
    public String detail(){
        return "product_detail";
    }




}
