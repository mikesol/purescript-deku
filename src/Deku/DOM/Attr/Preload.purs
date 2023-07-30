module Deku.DOM.Attr.Preload where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Preload = Preload

instance Attr Audio_ Preload String where
  attr Preload bothValues  = unsafeAttribute $ Both { key: "preload", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "preload", value:  prop' value  })
  pureAttr Preload value  = unsafeAttribute $ This { key: "preload", value:  prop' value  }
  unpureAttr Preload eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "preload", value:  prop' value  }

instance Attr Video_ Preload String where
  attr Preload bothValues  = unsafeAttribute $ Both { key: "preload", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "preload", value:  prop' value  })
  pureAttr Preload value  = unsafeAttribute $ This { key: "preload", value:  prop' value  }
  unpureAttr Preload eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "preload", value:  prop' value  }

instance Attr everything Preload Unit where
  attr Preload bothValues  = unsafeAttribute $ Both { key: "preload", value:  unset'  } (snd bothValues <#> \_ -> { key: "preload", value:  unset'  })
  pureAttr Preload _  = unsafeAttribute $ This { key: "preload", value:  unset'  }
  unpureAttr Preload eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "preload", value:  unset'  }
