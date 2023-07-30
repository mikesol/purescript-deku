module Deku.DOM.Attr.Default where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Track (Track_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Default = Default

instance Attr Track_ Default String where
  attr Default bothValues  = unsafeAttribute $ Both { key: "default", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "default", value:  prop' value  })
  pureAttr Default value  = unsafeAttribute $ This { key: "default", value:  prop' value  }
  unpureAttr Default eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "default", value:  prop' value  }

instance Attr everything Default Unit where
  attr Default bothValues  = unsafeAttribute $ Both { key: "default", value:  unset'  } (snd bothValues <#> \_ -> { key: "default", value:  unset'  })
  pureAttr Default _  = unsafeAttribute $ This { key: "default", value:  unset'  }
  unpureAttr Default eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "default", value:  unset'  }
