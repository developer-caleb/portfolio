//콜렉션
const COLLECTION_USERS = 'Users';
const COLLECTION_WITHDRAWALS = 'Withdrawals';
const COLLECTION_MATJIP = 'Matjips';
const COLLECTION_MYMATJIP = 'MyMatjips';
const COLLECTION_TABLES = 'Tables';
const COLLECTION_NOTICES = 'Notices';
const COLLECTION_REVIEWS = 'Reviews';
const COLLECTION_NOTIFICATIONS = 'Notifications';
const COLLECTION_FOLDERS = 'Folders';
const COLLECTION_REPORTS = 'Reports';
const COLLECTION_PLACES = 'Places';
const COLLECTION_LIKE = 'Likes';
const COLLECTION_LIST = 'Lists';
const SUB_COLLECTION_POINT_HISTORY = 'point_history';
const SUB_COLLECTION_FOLLOWERS = 'Followers';
const SUB_COLLECTION_FOLLOWINGS = 'Followings';
//const COLLECTION_ = 'Menus';
const COLLECTION_MENUES = 'Menus';
const COLLECTION_MANAGERTALK = 'ManagerTalk';
const COLLECTION_MEMBERTALK = 'MemberTalk';
const COLLECTION_BOARDS = 'Boards';
const COLLECTION_COMMENTS = 'Comments';
const COLLECTION_GALLERYS = 'Gallerys';
const COLLECTION_INQUIRES = 'Inquires';
const COLLECTION_CHATS = 'Chats';
const COLLECTION_MOIMS = 'Moims';
const COLLECTION_COLLECTIONS = 'Collections';
const COLLECTION_PURCHASE = 'Purchases';

//유저
const KEY_LOGINTYPE = "logintype";
const KEY_UPDATE = "update";
const KEY_LOCATIONCODE = "locationcode";
const KEY_NICKNAME = 'nickname';
const KEY_PRIVATE = 'private';
const KEY_COLLECTION_LIST = 'collectionList';
const KEY_COLLECTION_NEW = 'collectionNew';
const KEY_LASTNICKCHANGE = 'lastnickchange';
const KEY_CREATED = 'created';
const KEY_UID = 'uid';
const KEY_RECOMMENDER_ID = 'recommenderId';
const KEY_USERIMG = 'userimg';
const KEY_UNSEENNOTI = 'unseennoti';
const KEY_MOIMS = 'moims';
const KEY_BLOCKINGUSERS = 'blockingusers'; //내가 블로킹
const KEY_BLOCKEDUSERS = 'blockedusers'; //내가 블록 당함
const KEY_INTEREST_TAGS = 'interest_tags'; // 관심사 태그
const KEY_NATIONAL_CODE = 'national_code';
const KEY_LANGUAGE_CODE = 'language_code';
const KEY_BANNED = 'banned';
const KEY_FOLLOWING = 'following';
const KEY_FOLLOWER = 'follower';
const KEY_USERPOINTDATE = 'userpointdate';
const KEY_USERPOINT = 'userpoint';
const KEY_USERTYPE = 'usertype'; //master, manager, member
const KEY_FOLLOWTABLE = 'followtable';
const KEY_JOINED_GROUP = 'joined_group';
const KEY_FOLDERNAME = "foldername";
const KEY_FOLDERID = "folderid";
const KEY_HASINQUIREANSWER = "hasinquireanswer";
const KEY_TOKEN = "token";
const KEY_DEVICE = "device";
const KEY_PACKAGE = "package";
const KEY_ORDER_DATE = 'order_date';
const KEY_ORDER_CATEGORY = 'order_category';
const KEY_LEVEL = 'level';
const KEY_EXPERIENCE_POINT = 'experience_point';
const KEY_GOLD_POINT = 'gold_point';
const KEY_DIAMOND_POINT = 'diamond_point';
const KEY_LAST_TIME_DB_SAVE = 'lastTimeDbSave';
const KEY_MAX_LIST_LENGTH = 'maxListLength';
const KEY_DETAIL_STAR = 'detail_star';

//테이블
//맛집
const KEY_MATJIP_ID = 'matjipid';
const KEY_MATJIPNAME = 'matjipname';
const KEY_ADDRESS = "address";
const KEY_ADDRESS_SIMPLE = 'addresssimple';
const KEY_ADDRESSDETAIL = 'addressdetail';
const KEY_ADDRESSCODE = 'addresscode';
const KEY_STARS = 'starnum';
const KEY_SHARED_MOIM = 'shared_moim';
const KEY_DESCRIPTION = 'description';
const KEY_IMGURLS = 'imageurls';
const KEY_THUMBNAILURLS = 'thumbnailimageurls';
const KEY_IS_WRITER_IMG_CIRCLE = 'isWriterImgCircle';
const KEY_WRITER_BACKGROUND_COLOR = 'writerBackgroundColor';
const KEY_WRITERIMG = 'writerimg';
const KEY_INVISIBLE = 'invisible';
const KEY_USER_LANGUAGE_CODE = 'user_language_code';
const KEY_USER_LOCATION_CODE = 'user_location_code'; //유저가 다른 나라 소속이면 따로 글보여주기 위함
const KEY_WRITER_BANNED = 'writer_banned'; //게시물 개별로 ban도 가능
const KEY_WRITERPRIVATE = 'writerprivate';
const KEY_MAKERUID = 'makeruid';
const KEY_MAKERNAME = 'makername';
const KEY_LISTOFLIKES = 'listoflikes';
const KEY_LISTOFDISLIKES = 'listofdislikes';
const KEY_LISTOFCOMMENT = 'listofcomment';
const KEY_COUNTLIKES = 'countlikes';
const KEY_COUNTDISLIKES = 'countdislikes';
const KEY_COUNTCOMMENTS = 'countcomments';
const KEY_VISITED = 'visited';
const KEY_GEO_LOCATION = 'geolocation';
const KEY_PLACE_LOC = 'place_loc';
const KEY_CATEGORY_GROUP_NAME = 'category_group_name';
const KEY_CATEGORY_NAME = 'category_name';
const KEY_KAKAO_ID = 'kakao_id';
const KEY_GOOGLE_ID = 'google_id';
const KEY_PHONE = 'phone';
const KEY_KAKAO_URL = 'kakao_url';
const KEY_TAGS = 'tags';
const KEY_REFERENCE = 'reference';
const KEY_LINKED_MATJIP = 'linked_matjip';
const KEY_MAKER_FOLLOWERS = 'maker_followers';
const KEY_MAP_COLOR = 'map_color';
const KEY_SHORT_DESCRIPTION = 'short_description';
const KEY_SUPPLY_COMPANY = 'supply_company';
const KEY_IS_MATJIP = 'isMatjip';
const KEY_LISTS = 'lists';
//장소
const KEY_PLACE_ID = 'placeid';
const KEY_LIST_OF_REVIEW = 'listOfReview';
const KEY_COUNT_CHILD = 'count_child';
const KEY_ORDER_POINT = 'order_point';
const KEY_STAR_AVG = 'star_avg';
const KEY_IS_MASTER_CERT = 'is_master_cert'; //-> 사장님 cert인 거 같은데, 사장님 uid로 바꿔서 isempty로 해주는거 어때
const KEY_ADDITIONAL_DATA = 'additionalData';
const KEY_ADDITIONAL_GOOGLE_DATA = 'additionalGoogleData';

//댓글
const KEY_BUNDLE_ID = 'bundleid';
const KEY_BUNDLE_ORDER = 'bundleorder';
const KEY_DELETED = 'deleted';
const KEY_PROGRESSING = 'progressing';

//알림
const KEY_NOTIID = 'notiId';
const KEY_TYPE = 'type';
const KEY_TARGETUID = 'targetUid';
const KEY_SUBUSERUID = 'subUserUid';
const KEY_GETTOUID = 'getToUid';
const KEY_SUBUSERNAME = 'subUserName';
const KEY_SUBUSERIMG = 'subUserImg';
const KEY_SEEN = 'seen';
const KEY_IS_SEEN = 'isSeen';
const KEY_ROUTES = "routes";
const KEY_IMG_URL = 'imgUrl';
const KEY_IS_IMG_CIRCLE = 'isImgCircle';
const KEY_THUMB_URL = 'thumbUrl';
const KEY_MAIN_TAP_REF = 'mainTapRef';
const KEY_USERMODEL = 'userModel';
const KEY_COMMENTMODEL = 'commentModel';
const KEY_MATJIPMODEL = 'matjipModel';
const KEY_POINT = 'point';

//Report
const KEY_REPORTUSERUID = 'reportuseruid';
const KEY_REPORTCONTENTSTYPE = 'reportcontentstype';
const KEY_TARGET_REFERENCE = 'target_reference';
const KEY_REPORTSTATE = 'reportstate';
//const KEY_TEXT='text';

//폴더

//메뉴
const KEY_WRITED = 'writed';
const KEY_TIMESTAMP = 'Timestamp';
const KEY_DATA = 'data';
const KEY_TARGETDATE = 'targetdate';
const KEY_TARGETDATETIMESTAMP = 'targetdateTimestamp';
const KEY_SAVETYPE = 'savetype';
const KEY_MENUID = 'menuid';
const KEY_RECENTMENU = 'recentMenu';
const KEY_TABLEIMGURL = 'tableimgurl';
const KEY_IMGURL = 'imageurl';

//광장
const KEY_CONTENTS = 'contents';
const KEY_TITLE = 'title';
const KEY_WRITER = 'writer';

//공지사항
//-> 광장과 동일한 KEY 사용
const KEY_NOTICEID = 'noticeid';

//문의
//-> 광장과 동일한 KEY 사용
const KEY_ROOMID = 'roomid';
const KEY_INQUIREID = 'inquireid';
const KEY_WRITEUSER = 'writeuser';
const KEY_LASTCONTENTS = 'lastcontents';
const KEY_DIRTYNUM = 'dirtynum';
const KEY_IS_NOTIFY = 'isNotify';

//폴더
//const KEY_MATJIPCOUNT = 'matjipcount';
const KEY_ISSELECTED = 'isSelected';
const KEY_ID = 'id';
const KEY_ISDIRTY = 'isdirty';
const KEY_ISSPECIALFOLDER = 'isSpecialFolder';
//const KEY_CREATED = 'created'; 이미 있음
const KEY_MODIFIED = 'modified';
const KEY_NAME = 'name';
const KEY_ISPARENT = 'isparent';

//Comment
const KEY_COMMENT = 'comment';
const KEY_COMMENTTIME = 'commenttime';
const KEY_COMMENTID = 'commentid';
const KEY_COMMENTREF = 'commentref';

//Review
const KEY_REVIEW_ID = 'reviewId';

//사진첩
const KEY_GALLERYID = 'galleryid';

//모임

const KEY_LEADER_UID = 'leader_uid';
const KEY_SUB_LEADERS = 'sub_leaders';
const KEY_MOIM_NAME = 'moim_name';
const KEY_MOIM_IMAGE = 'moim_image';
const KEY_MOIM_THUMB = 'moim_thumb';
const KEY_OPEN_MOIM = 'open_moim';
const KEY_MOIM_UID = 'moim_uid';
const KEY_PASSWORD = 'password';
const KEY_MEMBERNUM = 'member_num';
const SUBKEY_BOARD_NAME = 'board_name';
const SUBKEY_BOARD_TYPE = 'board_type';
const KEY_BOARD_LIST = 'board_list';
const KEY_BOARD_ID = 'board_id';
const KEY_BOARD_IDX = 'board_idx';
const KEY_LAST_CHAT_ID = 'last_chat_id';
const KEY_MATJIP_COUNT = 'matjip_count';

//Report

//Collections
const KEY_COLLECTION_NAME = 'collectionName';
const KEY_OWNER_UID = 'ownerUid';
const KEY_OWNER_NAME = 'ownerName';
const KEY_COLLECTION_UID = 'collectionUid';
const KEY_IMAGE_URL = 'imageUrl';
const KEY_COLLECTION_TYPE = 'collectionType';
const KEY_IS_OWN = 'isOwn';
const KEY_BACKGROUND_COLOR = 'backgroundColor';
const KEY_TEXT_COLOR = 'textColor';

//Lists
const KEY_List_NAME = 'listName';
const KEY_LIST_ID = 'listId';
const KEY_POST_TYPE = 'postType';
const KEY_POST_LIST = 'postList';
const KEY_IS_PUBLISHED = 'isPublished';
const KEY_PRICE = 'price';

//Point History
const KEY_XP = 'xp';
const KEY_GOLD = 'gold';
const KEY_DIAMOND = 'diamond';
const KEY_ACTOR = 'actor';
const KEY_TOTAL_POINT = 'totalPoint';
const KEY_POINT_CLASS = 'pointClass';

//PURCHASE
const KEY_LOCALVERIFICATIONDATA = 'localVerificationData';
const KEY_SERVERVERIFICATIONDATA = 'serverVerificationData';
const KEY_SOURCE = 'source';
const KEY_PURCHASEID = 'purchaseID';
const KEY_PRODUCTID = 'productID';
const KEY_TRANSACTIONDATE = 'transactionDate';
const KEY_STATUS = 'status';
