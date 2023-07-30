module Deku.DOM.Attr.OnCanplaythrough where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnCanplaythrough = OnCanplaythrough

instance Attr anything OnCanplaythrough Cb where
  attr OnCanplaythrough bothValues  = unsafeAttribute $ Both { key: "canplaythrough", value:  cb' (fst bothValues)  } (snd bothValues <#> \value -> { key: "canplaythrough", value:  cb' value  })
  pureAttr OnCanplaythrough value  = unsafeAttribute $ This { key: "canplaythrough", value:  cb' value  }
  unpureAttr OnCanplaythrough eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "canplaythrough", value:  cb' value  }

instance Attr anything OnCanplaythrough (Effect Unit) where
  attr OnCanplaythrough bothValues  = unsafeAttribute $ Both { key: "canplaythrough", value:  cb' (Cb (const ((fst bothValues) $> true)))  } (snd bothValues <#> \value -> { key: "canplaythrough", value:  cb' (Cb (const (value $> true)))  })
  pureAttr OnCanplaythrough value  = unsafeAttribute $ This { key: "canplaythrough", value:  cb' (Cb (const (value $> true)))  }
  unpureAttr OnCanplaythrough eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "canplaythrough", value:  cb' (Cb (const (value $> true)))  }

instance Attr anything OnCanplaythrough (Effect Boolean) where
  attr OnCanplaythrough bothValues  = unsafeAttribute $ Both { key: "canplaythrough", value:  cb' (Cb (const (fst bothValues)))  } (snd bothValues <#> \value -> { key: "canplaythrough", value:  cb' (Cb (const value))  })
  pureAttr OnCanplaythrough value  = unsafeAttribute $ This { key: "canplaythrough", value:  cb' (Cb (const value))  }
  unpureAttr OnCanplaythrough eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "canplaythrough", value:  cb' (Cb (const value))  }

type OnCanplaythroughEffect =
  forall element
   . Attr element OnCanplaythrough (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnCanplaythrough Unit where
  attr OnCanplaythrough bothValues  = unsafeAttribute $ Both { key: "canplaythrough", value:  unset'  } (snd bothValues <#> \_ -> { key: "canplaythrough", value:  unset'  })
  pureAttr OnCanplaythrough _  = unsafeAttribute $ This { key: "canplaythrough", value:  unset'  }
  unpureAttr OnCanplaythrough eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "canplaythrough", value:  unset'  }
