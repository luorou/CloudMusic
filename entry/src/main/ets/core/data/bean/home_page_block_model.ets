export enum BlockCode{
  HOMEPAGE_BANNER="HOMEPAGE_BANNER",
  HOMEPAGE_BLOCK_OLD_DRAGON_BALL="HOMEPAGE_BLOCK_OLD_DRAGON_BALL",
  HOMEPAGE_BLOCK_PLAYLIST_RCMD="HOMEPAGE_BLOCK_PLAYLIST_RCMD",
  HOMEPAGE_BLOCK_STYLE_RCMD="HOMEPAGE_BLOCK_STYLE_RCMD",
  HOMEPAGE_BLOCK_NEW_ALBUM_NEW_SONG="HOMEPAGE_BLOCK_NEW_ALBUM_NEW_SONG",


}


export interface HomeBlockResp {
  cursor:             string;
  blocks:             Block[];
  hasMore:            boolean;
  blockUUIDs:         null;
  pageConfig:         PageConfig;
  guideToast:         GuideToast;
  internalTest:       null;
  titles:             any[];
  blockCodeOrderList: null;
  exposedResource:    string;
  demote:             boolean;
}

export interface Block {
  blockCode:            string;
  showType:             string;
  dislikeShowType:      number;
  extInfo?:             EXTInfo;
  canClose:             boolean;
  blockStyle:           number;
  canFeedback:          boolean;
  blockDemote:          boolean;
  sort:                 number;
  creatives?:           Creative[];
  crossPlatformConfig?: CrossPlatformConfig;
  uiElement?:           BlockUIElement;
  resourceIdList?:      string[];
}

export interface Creative {
  creativeType:       string;
  resources:          Resource[];
  position:           number;
  uiElement?:         CreativeUIElement;
  creativeId?:        string;
  algCreativeId?:     string;
  action?:            string;
  actionType?:        ActionType;
  creativeExtInfoVO?: CreativeEXTInfoVO;
  alg?:               string;
  algReason?:         AlgReason;
}

export enum ActionType {
  ClientCustomized = "client_customized",
  Orpheus = "orpheus",
}

export enum AlgReason {
  超10万人评论 = "超10万人评论",
  超万人评论 = "超万人评论",
}

export interface CreativeEXTInfoVO {
  topListSongIds:    number[];
  topListOriginType: string;
  topListOriginId?:  string;
  updateFrequency:   string;
  playCount?:        number;
}

export interface Resource {
  uiElement:           ResourceUIElement;
  resourceType:        ResourceType;
  resourceState:       null;
  resourceId:          string;
  resourceUrl:         null;
  resourceExtInfo:     ResourceEXTInfo | null;
  action:              null | string;
  actionType:          ActionType | null;
  valid:               boolean;
  alg:                 null | string;
  logInfo:             LogInfo | null;
  ctrp:                null;
  likedCount:          number | null;
  replyCount:          number | null;
  resourceContentList: string[] | null;
  position:            null;
  playParams:          null;
}

export enum LogInfo {
  Category1SongCategory22019573476 = "{\"category1\":\"song\",\"category2\":\"2019573476\"}",
  Empty = "",
  Reason超74人播放 = "{\"reason\":\"超74%人播放\"}",
  Reason超88人播放 = "{\"reason\":\"超88%人播放\"}",
}

export interface ResourceEXTInfo {
  artists?:           Artist[];
  song?:              Song;
  songData?:          SongData;
  hasListened:        boolean;
  songPrivilege?:     SongPrivilege;
  commentSimpleData?: CommentSimpleData;
  users?:             User[];
  threadId?:          string;
  alias?:             string;
  startTime?:         number;
  heardLyrics?:       HeardLyric[];
}

export interface Artist {
  name:        string;
  id:          number;
  picId:       number;
  img1v1Id:    number;
  briefDesc:   string;
  picUrl:      null | string;
  img1v1Url:   null | string;
  albumSize:   number;
  alias:       any[] | null;
  trans:       null | string;
  musicSize:   number;
  topicPerson: number;
}

export interface CommentSimpleData {
  content:   string;
  commentId: number;
  threadId:  string;
  userId:    number;
  userName:  string;
}

export interface HeardLyric {
  bg: number;
  wd: string;
}

export interface Song {
  name:                 string;
  id:                   number;
  pst:                  number;
  t:                    number;
  ar:                   Ar[];
  alia:                 string[];
  pop:                  number;
  st:                   number;
  rt:                   Rt | null;
  fee:                  number;
  v:                    number;
  crbt:                 null;
  cf:                   string;
  al:                   Al;
  dt:                   number;
  h:                    H;
  m:                    H;
  l:                    H;
  sq:                   H | null;
  hr:                   H | null;
  a:                    null;
  cd:                   string;
  no:                   number;
  rtUrl:                null;
  ftype:                number;
  rtUrls:               any[];
  djId:                 number;
  copyright:            number;
  s_id:                 number;
  mark:                 number;
  originCoverType:      number;
  originSongSimpleData: OriginSongSimpleData | null;
  tagPicList:           null;
  resourceState:        boolean;
  version:              number;
  songJumpInfo:         null;
  entertainmentTags:    null;
  single:               number;
  noCopyrightRcmd:      null;
  rtype:                number;
  rurl:                 null;
  mst:                  number;
  cp:                   number;
  mv:                   number;
  publishTime:          number;
  videoInfo:            VideoInfo;
}

export interface Al {
  id:       number;
  name:     string;
  picUrl:   string;
  tns:      any[];
  pic_str?: string;
  pic:      number;
}

export interface Ar {
  id:    number;
  name:  string;
  tns:   any[];
  alias: any[];
}

export interface H {
  br:   number;
  fid:  number;
  size: number;
  vd:   number;
  sr:   number;
}

export interface OriginSongSimpleData {
  songId:    number;
  name:      string;
  artists:   AlbumMeta[];
  albumMeta: AlbumMeta;
}

export interface AlbumMeta {
  id:   number;
  name: string;
}

export enum Rt {
  Empty = "",
  The600902000005371162 = "600902000005371162",
  The600907000002790687 = "600907000002790687",
}

export interface VideoInfo {
  moreThanOne: boolean;
  video:       Video | null;
}

export interface Video {
  vid:         string;
  type:        number;
  title:       string;
  playTime:    number;
  coverUrl:    string;
  publishTime: number;
  artists:     null;
  alias:       null;
}

export interface SongData {
  name:                 string;
  id:                   number;
  position:             number;
  alias:                string[];
  status:               number;
  fee:                  number;
  copyrightId:          number;
  disc:                 string;
  no:                   number;
  artists:              Artist[];
  album:                Album;
  starred:              boolean;
  popularity:           number;
  score:                number;
  starredNum:           number;
  duration:             number;
  playedNum:            number;
  dayPlays:             number;
  hearTime:             number;
  sqMusic:              Music | null;
  hrMusic:              Music | null;
  ringtone:             Rt | null;
  crbt:                 null;
  audition:             null;
  copyFrom:             string;
  commentThreadId:      string;
  rtUrl:                null;
  ftype:                number;
  rtUrls:               any[];
  copyright:            number;
  transName:            null | string;
  sign:                 null;
  mark:                 number;
  originCoverType:      number;
  originSongSimpleData: OriginSongSimpleData | null;
  single:               number;
  noCopyrightRcmd:      null;
  hMusic:               Music;
  mMusic:               Music;
  lMusic:               Music;
  bMusic:               Music;
  mp3Url:               null;
  rtype:                number;
  rurl:                 null;
  mvid:                 number;
  transNames?:          string[];
}

export interface Album {
  name:            string;
  id:              number;
  type:            Type;
  size:            number;
  picId:           number;
  blurPicUrl:      string;
  companyId:       number;
  pic:             number;
  picUrl:          string;
  publishTime:     number;
  description:     string;
  tags:            string;
  company:         null | string;
  briefDesc:       string;
  artist:          Artist;
  songs:           any[];
  alias:           string[];
  status:          number;
  copyrightId:     number;
  commentThreadId: string;
  artists:         Artist[];
  subType:         SubType;
  transName:       null | string;
  onSale:          boolean;
  mark:            number;
  gapless:         number;
  picId_str?:      string;
  transNames?:     string[];
}

export enum SubType {
  录音室版 = "录音室版",
}

export enum Type {
  Ep = "EP",
  Single = "Single",
  专辑 = "专辑",
}

export interface Music {
  name:        null;
  id:          number;
  size:        number;
  extension:   Extension;
  sr:          number;
  dfsId:       number;
  bitrate:     number;
  playTime:    number;
  volumeDelta: number;
}

export enum Extension {
  FLAC = "flac",
  Mp3 = "mp3",
}

export interface SongPrivilege {
  id:                 number;
  fee:                number;
  payed:              number;
  realPayed:          number;
  st:                 number;
  pl:                 number;
  dl:                 number;
  sp:                 number;
  cp:                 number;
  subp:               number;
  cs:                 boolean;
  maxbr:              number;
  fl:                 number;
  pc:                 null;
  toast:              boolean;
  flag:               number;
  paidBigBang:        boolean;
  preSell:            boolean;
  playMaxbr:          number;
  downloadMaxbr:      number;
  maxBrLevel:         MaxBrLevel;
  playMaxBrLevel:     MaxBrLevel;
  downloadMaxBrLevel: MaxBrLevel;
  plLevel:            LLevel;
  dlLevel:            LLevel;
  flLevel:            LLevel;
  rscl:               null;
  freeTrialPrivilege: FreeTrialPrivilege;
  rightSource:        number;
  chargeInfoList:     ChargeInfoList[];
}

export interface ChargeInfoList {
  rate:          number;
  chargeUrl:     null;
  chargeMessage: null;
  chargeType:    number;
}

export enum LLevel {
  Exhigh = "exhigh",
  None = "none",
  Standard = "standard",
}

export enum MaxBrLevel {
  Exhigh = "exhigh",
  Hires = "hires",
  Lossless = "lossless",
  Sky = "sky",
}

export interface FreeTrialPrivilege {
  resConsumable:      boolean;
  userConsumable:     boolean;
  listenType:         null;
  cannotListenReason: number | null;
}

export interface User {
  defaultAvatar:       boolean;
  province:            number;
  authStatus:          number;
  followed:            boolean;
  avatarUrl:           null;
  accountStatus:       number;
  gender:              number;
  city:                number;
  birthday:            number;
  userId:              number;
  userType:            number;
  nickname:            string;
  signature:           null;
  description:         null;
  detailDescription:   null;
  avatarImgId:         number;
  backgroundImgId:     number;
  backgroundUrl:       null;
  authority:           number;
  mutual:              boolean;
  expertTags:          null;
  experts:             null;
  djStatus:            number;
  vipType:             number;
  remarkName:          null;
  authenticationTypes: number;
  avatarDetail:        null;
  avatarImgIdStr:      string;
  backgroundImgIdStr:  string;
  anchor:              boolean;
}

export enum ResourceType {
  Album = "album",
  DigitalAlbum = "digitalAlbum",
  DragonBall = "dragon_ball",
  Orpheus = "orpheus",
  Song = "song",
}

export interface ResourceUIElement {
  mainTitle:    PurpleMainTitle;
  image?:       Image;
  rcmdShowType: RcmdShowType;
  subTitle?:    PurpleSubTitle;
  description?: Description;
  labelText?:   LabelText;
}

export enum Description {
  Down = "down",
  Equal = "equal",
  New = "new",
  Up = "up",
}

export interface Image {
  action?:     string;
  title?:      string;
  imageUrl:    string;
  imageUrl2?:  string;
  purePicture: boolean;
}

export interface LabelText {
  text:         null | string;
  textColor:    TextColor | null;
  newTextColor: null;
  labelUrl:     null | string;
  newLabelUrl:  null;
}

export enum TextColor {
  ColorSecondary4 = "colorSecondary4",
  ColorSecondary7 = "colorSecondary7",
}

export interface PurpleMainTitle {
  title:            string;
  canShowTitleLogo: boolean;
  serialNum?:       string;
  titleDesc?:       string;
}

export enum RcmdShowType {
  Default = "DEFAULT",
}

export interface PurpleSubTitle {
  title:            string;
  canShowTitleLogo: boolean;
  titleId?:         string;
  targetUrl?:       string;
  titleType?:       TitleType;
  rcmdText?:        string;
}

export enum TitleType {
  SongRcmdFromComment = "songRcmdFromComment",
  SongRcmdTag = "songRcmdTag",
}

export interface CreativeUIElement {
  rcmdShowType: RcmdShowType;
  mainTitle?:   FluffyMainTitle;
  button?:      Button;
  image?:       Image;
}

export interface Button {
  action:     string;
  actionType: ActionType;
  text:       Text;
  iconUrl:    null;
  biData:     null;
}

export enum Text {
  Empty = "",
  播放 = "播放",
  更多 = "更多",
}

export interface FluffyMainTitle {
  action?:          string;
  actionType?:      ActionType;
  title:            string;
  canShowTitleLogo: boolean;
  titleDesc?:       string;
  serialNum?:       string;
}

export interface CrossPlatformConfig {
  containerType: string;
  rnContent:     RnContent;
}

export interface RnContent {
  engineId:        string;
  moduleName:      string;
  component:       string;
  params:          Params;
  estimatedRatio:  string;
  estimatedHeight: number;
}

export interface Params {
}

export interface EXTInfo {
  banners?:    Banner[];
  title?:      string;
  subTitle?:   string;
  imgUrl?:     string;
  targetUrl?:  string;
  buttonText?: string;
  data?:       Datum[];
  lyricStyle?: string;
}

export interface Banner {
  bannerId:         string;
  pic:              string;
  exclusive:        boolean;
  titleColor:       string;
  showAdTag:        boolean;
  targetType:       number;
  targetId:         number;
  typeTitle:        string;
  url:              string;
  songFinishStatus: boolean;
  logInfo:          string;
}

export interface Datum {
  title:     string;
  label:     string;
  imgUrl:    string;
  targetUrl: string;
}

export interface BlockUIElement {
  subTitle:     FluffySubTitle;
  button?:      Button;
  rcmdShowType: RcmdShowType;
}

export interface FluffySubTitle {
  title:            string;
  canShowTitleLogo: boolean;
}

export interface GuideToast {
  hasGuideToast: boolean;
  toastList:     any[];
}

export interface PageConfig {
  refreshToast:          string;
  nodataToast:           string;
  refreshInterval:       number;
  title:                 null;
  fullscreen:            boolean;
  abtest:                string[];
  songLabelMarkPriority: string[];
  songLabelMarkLimit:    number;
  homepageMode:          string;
  showModeEntry:         boolean;
  orderInfo:             null;
}

export interface Trp {
  rules: string[];
}

