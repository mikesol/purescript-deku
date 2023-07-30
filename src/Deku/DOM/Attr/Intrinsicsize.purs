module Deku.DOM.Attr.Intrinsicsize where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Img (Img_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Intrinsicsize = Intrinsicsize

instance Attr Img_ Intrinsicsize String where
  attr Intrinsicsize bothValues  = unsafeAttribute $ Both { key: "intrinsicsize", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "intrinsicsize", value:  prop' value  })
  pureAttr Intrinsicsize value  = unsafeAttribute $ This { key: "intrinsicsize", value:  prop' value  }
  unpureAttr Intrinsicsize eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "intrinsicsize", value:  prop' value  }

instance Attr everything Intrinsicsize Unit where
  attr Intrinsicsize bothValues  = unsafeAttribute $ Both { key: "intrinsicsize", value:  unset'  } (snd bothValues <#> \_ -> { key: "intrinsicsize", value:  unset'  })
  pureAttr Intrinsicsize _  = unsafeAttribute $ This { key: "intrinsicsize", value:  unset'  }
  unpureAttr Intrinsicsize eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "intrinsicsize", value:  unset'  }
