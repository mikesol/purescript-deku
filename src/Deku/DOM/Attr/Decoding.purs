module Deku.DOM.Attr.Decoding where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Img (Img_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Decoding = Decoding

instance Attr Img_ Decoding String where
  attr Decoding bothValues  = unsafeAttribute $ Both { key: "decoding", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "decoding", value:  prop' value  })
  pureAttr Decoding value  = unsafeAttribute $ This { key: "decoding", value:  prop' value  }
  unpureAttr Decoding eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "decoding", value:  prop' value  }

instance Attr everything Decoding Unit where
  attr Decoding bothValues  = unsafeAttribute $ Both { key: "decoding", value:  unset'  } (snd bothValues <#> \_ -> { key: "decoding", value:  unset'  })
  pureAttr Decoding _  = unsafeAttribute $ This { key: "decoding", value:  unset'  }
  unpureAttr Decoding eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "decoding", value:  unset'  }
