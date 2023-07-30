module Deku.DOM.Attr.Ry where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Ry = Ry

instance Attr Ellipse_ Ry String where
  attr Ry bothValues  = unsafeAttribute $ Both { key: "ry", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "ry", value:  prop' value  })
  pureAttr Ry value  = unsafeAttribute $ This { key: "ry", value:  prop' value  }
  unpureAttr Ry eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "ry", value:  prop' value  }

instance Attr Rect_ Ry String where
  attr Ry bothValues  = unsafeAttribute $ Both { key: "ry", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "ry", value:  prop' value  })
  pureAttr Ry value  = unsafeAttribute $ This { key: "ry", value:  prop' value  }
  unpureAttr Ry eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "ry", value:  prop' value  }

instance Attr everything Ry Unit where
  attr Ry bothValues  = unsafeAttribute $ Both { key: "ry", value:  unset'  } (snd bothValues <#> \_ -> { key: "ry", value:  unset'  })
  pureAttr Ry _  = unsafeAttribute $ This { key: "ry", value:  unset'  }
  unpureAttr Ry eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "ry", value:  unset'  }
