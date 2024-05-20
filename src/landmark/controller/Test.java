package landmark.controller;

import java.util.List;

import landmark.service.ILandmarkService;
import landmark.service.LandmarkServiceImpl;
import landmark.vo.LandmarkVO;


public class Test {

    private ILandmarkService landSer;

    public Test() {
    	landSer = LandmarkServiceImpl.getInstance();
    }

    public static void main(String[] args) {
        Test test = new Test();
        test.selectAll();
    }

    public void selectAll() {
    	System.out.println("인터넷바꿔주세요");
        List<LandmarkVO> landList = landSer.selectAll();

        if (landList.size() == 0) {
            System.out.println("공지사항이 없습니다.");
        } else {
            for (LandmarkVO lv : landList) {
                System.out.println(lv.getLandNum());
            }
        }
    }
}
