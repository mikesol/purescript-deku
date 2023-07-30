module Deku.DOM.Attr.Srcset where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Source (Source_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Srcset = Srcset

instance Attr Img_ Srcset String where
  attr Srcset bothValues  = unsafeAttribute $ Both { key: "srcset", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "srcset", value:  prop' value  })
  pureAttr Srcset value  = unsafeAttribute $ This { key: "srcset", value:  prop' value  }
  unpureAttr Srcset eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "srcset", value:  prop' value  }

instance Attr Source_ Srcset String where
  attr Srcset bothValues  = unsafeAttribute $ Both { key: "srcset", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "srcset", value:  prop' value  })
  pureAttr Srcset value  = unsafeAttribute $ This { key: "srcset", value:  prop' value  }
  unpureAttr Srcset eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "srcset", value:  prop' value  }

instance Attr everything Srcset Unit where
  attr Srcset bothValues  = unsafeAttribute $ Both { key: "srcset", value:  unset'  } (snd bothValues <#> \_ -> { key: "srcset", value:  unset'  })
  pureAttr Srcset _  = unsafeAttribute $ This { key: "srcset", value:  unset'  }
  unpureAttr Srcset eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "srcset", value:  unset'  }
