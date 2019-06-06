package com.strayfootball.api.controller;

import com.strayfootball.api.authorization.annotation.Authorization;
import com.strayfootball.api.authorization.context.BaseContextHandler;
import com.strayfootball.api.dto.ResponseModel;
import com.strayfootball.api.dto.request.user.UserRequest;
import com.strayfootball.api.exception.ApiException;
import com.strayfootball.api.service.UserService;
import com.strayfootball.api.util.FileUtil;
import com.strayfootball.api.util.StringUtil;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

import static com.strayfootball.api.dto.ResponseModel.error;

/**
 * description
 * 球员控制器
 *
 * @author Karl
 * @create 2019/6/1 18:27
 */
@RestController
@RequestMapping("/api/user")
public class UserController {
    private final UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    /**
     * 获取所有球球员信息
     *
     * @return ok
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST, consumes = "application/json")
    @Authorization(onlyGetCustomer = true)
    public ResponseModel list(@RequestBody UserRequest request) {
        try {
            return ResponseModel.ok(userService.listBySelect(request));
        } catch (ApiException ex) {
            return error(ex);
        } catch (Exception ex) {
            return error(ex, this.getClass());
        }
    }

    /**
     * 获取球队所有员信息
     *
     * @return ok
     */
    @RequestMapping(value = "/listByTeamId", method = RequestMethod.POST, consumes = "application/json")
    @Authorization(onlyGetCustomer = true)
    public ResponseModel listByTeamId(@RequestBody UserRequest request) {
        try {
            return ResponseModel.ok(userService.list(request));
        } catch (ApiException ex) {
            return error(ex);
        } catch (Exception ex) {
            return error(ex, this.getClass());
        }
    }


    /**
     * 获取所有球员信息，
     *
     * @return ok
     */
    @RequestMapping(value = "/listPlayer", method = RequestMethod.POST, consumes = "application/json")
    @Authorization(onlyGetCustomer = true)
    public ResponseModel listPlayer(@RequestBody UserRequest request) {
        try {
            return ResponseModel.ok(userService.listPlayer(request));
        } catch (ApiException ex) {
            return error(ex);
        } catch (Exception ex) {
            return error(ex, this.getClass());
        }
    }

    /**
     * 获取所有教练员
     *
     * @return ok
     */
    @RequestMapping(value = "/listTeacher", method = RequestMethod.POST, consumes = "application/json")
    @Authorization(onlyGetCustomer = true)
    public ResponseModel listTeacher(@RequestBody UserRequest request) {
        try {
            return ResponseModel.ok(userService.listTeacher(request));
        } catch (ApiException ex) {
            return error(ex);
        } catch (Exception ex) {
            return error(ex, this.getClass());
        }
    }


    /**
     * 管理员添加添加用户（供管理员添加使用）
     *
     * @return ok
     */
    @RequestMapping(value = "/adminAddUser", method = RequestMethod.POST, consumes = "application/json")
    public ResponseModel adminAddUser(@RequestBody UserRequest model) {
        try {
            userService.add(BaseContextHandler.getCustomerId(), model);
            return ResponseModel.ok();
        } catch (ApiException ex) {
            return error(ex);
        } catch (Exception ex) {
            return error(ex, this.getClass());
        }
    }

    /**
     * 用户注册（自己注册）
     *
     * @return ok
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST, consumes = "application/json")
    @Authorization(onlyGetCustomer = true)
    public ResponseModel register(@RequestBody UserRequest model) {
        try {
            userService.add(model);
            return ResponseModel.ok();
        } catch (ApiException ex) {
            return error(ex);
        } catch (Exception ex) {
            return error(ex, this.getClass());
        }
    }

    /**
     * 编辑信息
     *
     * @return ok
     */
    @RequestMapping(value = "/edit", method = RequestMethod.POST, consumes = "application/json")
    public ResponseModel edit(@RequestBody UserRequest model) {
        try {
            userService.edit(BaseContextHandler.getCustomerId(), model);
            return ResponseModel.ok();
        } catch (ApiException ex) {
            return error(ex);
        } catch (Exception ex) {
            return error(ex, this.getClass());
        }
    }

    /**
     * 删除信息
     *
     * @return ok
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST, consumes = "application/json")
    public ResponseModel delete(@RequestBody UserRequest model) {
        try {
            userService.delete(BaseContextHandler.getCustomerId(), model);
            return ResponseModel.ok();
        } catch (ApiException ex) {
            return error(ex);
        } catch (Exception ex) {
            return error(ex, this.getClass());
        }
    }

    /**
     * 获取详细信息
     *
     * @return ok
     */
    @RequestMapping(value = "/detailed", method = RequestMethod.POST, consumes = "application/json")
    @Authorization(onlyGetCustomer = true)
    public ResponseModel detailed(@RequestBody UserRequest model) {
        try {

            return ResponseModel.ok(userService.detailed(model));
        } catch (ApiException ex) {
            return error(ex);
        } catch (Exception ex) {
            return error(ex, this.getClass());
        }
    }

    /**
     * 用户登录
     *
     * @return ok
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST, consumes = "application/json")
    @Authorization(onlyGetCustomer = true)
    public ResponseModel login(@RequestBody UserRequest model) {
        try {
            return ResponseModel.ok(userService.login(model));
        } catch (ApiException ex) {
            return error(ex);
        } catch (Exception ex) {
            return error(ex, this.getClass());
        }
    }

    /**
     * 获取所有球员信息key
     *
     * @return ok
     */
    @RequestMapping(value = "/listKey", method = RequestMethod.POST, consumes = "application/json")
    public ResponseModel listKey() {
        try {
            return ResponseModel.ok(userService.listKey());
        } catch (ApiException ex) {
            return error(ex);
        } catch (Exception ex) {
            return error(ex, this.getClass());
        }
    }
        /**
         * 获取用户登录后自己的信息
         *
         * @return ok
         */
        @RequestMapping(value = "/myInfo", method = RequestMethod.POST, consumes = "application/json")
        public ResponseModel myInfo() {
            try {

                return ResponseModel.ok(userService.myInfo(BaseContextHandler.getCustomerId()));
            } catch (ApiException ex) {
                return error(ex);
            } catch (Exception ex) {
                return error(ex, this.getClass());
            }
        }

    /**
     * 编辑信息
     *
     * @return ok
     */
    @RequestMapping(value = "/signOut", method = RequestMethod.POST, consumes = "application/json")
    public ResponseModel signOut() {
        try {
            userService.signOut(BaseContextHandler.getCustomerId());
            return ResponseModel.ok();
        } catch (ApiException ex) {
            return error(ex);
        } catch (Exception ex) {
            return error(ex, this.getClass());
        }
    }
    @RequestMapping(value="/uploadImg", method = RequestMethod.POST)
    @Authorization(onlyGetCustomer = true)
    public ResponseModel uploadImg(@RequestParam("file") MultipartFile file) {
        try {
           // String fileName = file.getOriginalFilename();
            String fileName = StringUtil.uuid()+"."+FilenameUtils.getExtension("." + file.getOriginalFilename()).toLowerCase();
            //设置文件上传路径
            String filePath = "D:\\StrayFootball_web\\images\\upload\\";
            FileUtil.uploadFile(file.getBytes(), filePath, fileName);
            return new ResponseModel(100, "成功","images/upload/"+fileName);
        } catch (ApiException ex) {
            return error(ex);
        } catch (Exception ex) {
            return error(ex, this.getClass());
        }


    }


    @RequestMapping(value="/testuploadimg", method = RequestMethod.POST)
    @Authorization(onlyGetCustomer = true)
    public @ResponseBody String testuploadimg(HttpServletRequest request,@RequestParam("file") MultipartFile file) {
        String fileName = file.getOriginalFilename();
        //设置文件上传路径
        String filePath = request.getSession().getServletContext().getRealPath("imgupload/");
        try {
            FileUtil.uploadFile(file.getBytes(), filePath, fileName);
            return "上传成功";
        } catch (Exception e) {
            return "上传失败";
        }
    }
    /**
     * MultipartFile 转 File
     * @param multiFile
     * @return
     */
    public static File MultipartFileToFile(MultipartFile multiFile) {
        // 获取文件名
        String fileName = multiFile.getOriginalFilename();
        // 获取文件后缀
        String prefix = fileName.substring(fileName.lastIndexOf("."));
        // 用当前时间作为文件名，防止生成的临时文件重复
        try {
            File file = File.createTempFile(System.currentTimeMillis() + "", prefix);

            multiFile.transferTo(file);

            return file;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
