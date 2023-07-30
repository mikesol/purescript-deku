module Deku.DOM.Attr.Bias where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Bias = Bias

instance Attr FeConvolveMatrix_ Bias String where
  attr Bias bothValues  = unsafeAttribute $ Both { key: "bias", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "bias", value:  prop' value  })
  pureAttr Bias value  = unsafeAttribute $ This { key: "bias", value:  prop' value  }
  unpureAttr Bias eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "bias", value:  prop' value  }

instance Attr everything Bias Unit where
  attr Bias bothValues  = unsafeAttribute $ Both { key: "bias", value:  unset'  } (snd bothValues <#> \_ -> { key: "bias", value:  unset'  })
  pureAttr Bias _  = unsafeAttribute $ This { key: "bias", value:  unset'  }
  unpureAttr Bias eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "bias", value:  unset'  }
