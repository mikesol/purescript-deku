module Deku.DOM.Attr.OnWheel where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnWheel = OnWheel

instance Attr anything OnWheel Cb where
  attr OnWheel bothValues  = unsafeAttribute $ Both { key: "wheel", value:  cb' (fst bothValues)  } (snd bothValues <#> \value -> { key: "wheel", value:  cb' value  })
  pureAttr OnWheel value  = unsafeAttribute $ This { key: "wheel", value:  cb' value  }
  unpureAttr OnWheel eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "wheel", value:  cb' value  }

instance Attr anything OnWheel (Effect Unit) where
  attr OnWheel bothValues  = unsafeAttribute $ Both { key: "wheel", value:  cb' (Cb (const ((fst bothValues) $> true)))  } (snd bothValues <#> \value -> { key: "wheel", value:  cb' (Cb (const (value $> true)))  })
  pureAttr OnWheel value  = unsafeAttribute $ This { key: "wheel", value:  cb' (Cb (const (value $> true)))  }
  unpureAttr OnWheel eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "wheel", value:  cb' (Cb (const (value $> true)))  }

instance Attr anything OnWheel (Effect Boolean) where
  attr OnWheel bothValues  = unsafeAttribute $ Both { key: "wheel", value:  cb' (Cb (const (fst bothValues)))  } (snd bothValues <#> \value -> { key: "wheel", value:  cb' (Cb (const value))  })
  pureAttr OnWheel value  = unsafeAttribute $ This { key: "wheel", value:  cb' (Cb (const value))  }
  unpureAttr OnWheel eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "wheel", value:  cb' (Cb (const value))  }

type OnWheelEffect =
  forall element
   . Attr element OnWheel (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnWheel Unit where
  attr OnWheel bothValues  = unsafeAttribute $ Both { key: "wheel", value:  unset'  } (snd bothValues <#> \_ -> { key: "wheel", value:  unset'  })
  pureAttr OnWheel _  = unsafeAttribute $ This { key: "wheel", value:  unset'  }
  unpureAttr OnWheel eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "wheel", value:  unset'  }
