module Deku.DOM.Attr.Loading where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Loading = Loading

instance Attr Img_ Loading String where
  attr Loading bothValues  = unsafeAttribute $ Both { key: "loading", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "loading", value:  prop' value  })
  pureAttr Loading value  = unsafeAttribute $ This { key: "loading", value:  prop' value  }
  unpureAttr Loading eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "loading", value:  prop' value  }

instance Attr Iframe_ Loading String where
  attr Loading bothValues  = unsafeAttribute $ Both { key: "loading", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "loading", value:  prop' value  })
  pureAttr Loading value  = unsafeAttribute $ This { key: "loading", value:  prop' value  }
  unpureAttr Loading eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "loading", value:  prop' value  }

instance Attr everything Loading Unit where
  attr Loading bothValues  = unsafeAttribute $ Both { key: "loading", value:  unset'  } (snd bothValues <#> \_ -> { key: "loading", value:  unset'  })
  pureAttr Loading _  = unsafeAttribute $ This { key: "loading", value:  unset'  }
  unpureAttr Loading eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "loading", value:  unset'  }
