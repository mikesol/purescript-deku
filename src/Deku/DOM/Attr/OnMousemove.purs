module Deku.DOM.Attr.OnMousemove where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnMousemove = OnMousemove

instance Attr anything OnMousemove Cb where
  attr OnMousemove bothValues  = unsafeAttribute $ Both { key: "mousemove", value:  cb' (fst bothValues)  } (snd bothValues <#> \value -> { key: "mousemove", value:  cb' value  })
  pureAttr OnMousemove value  = unsafeAttribute $ This { key: "mousemove", value:  cb' value  }
  unpureAttr OnMousemove eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "mousemove", value:  cb' value  }

instance Attr anything OnMousemove (Effect Unit) where
  attr OnMousemove bothValues  = unsafeAttribute $ Both { key: "mousemove", value:  cb' (Cb (const ((fst bothValues) $> true)))  } (snd bothValues <#> \value -> { key: "mousemove", value:  cb' (Cb (const (value $> true)))  })
  pureAttr OnMousemove value  = unsafeAttribute $ This { key: "mousemove", value:  cb' (Cb (const (value $> true)))  }
  unpureAttr OnMousemove eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "mousemove", value:  cb' (Cb (const (value $> true)))  }

instance Attr anything OnMousemove (Effect Boolean) where
  attr OnMousemove bothValues  = unsafeAttribute $ Both { key: "mousemove", value:  cb' (Cb (const (fst bothValues)))  } (snd bothValues <#> \value -> { key: "mousemove", value:  cb' (Cb (const value))  })
  pureAttr OnMousemove value  = unsafeAttribute $ This { key: "mousemove", value:  cb' (Cb (const value))  }
  unpureAttr OnMousemove eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "mousemove", value:  cb' (Cb (const value))  }

type OnMousemoveEffect =
  forall element
   . Attr element OnMousemove (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnMousemove Unit where
  attr OnMousemove bothValues  = unsafeAttribute $ Both { key: "mousemove", value:  unset'  } (snd bothValues <#> \_ -> { key: "mousemove", value:  unset'  })
  pureAttr OnMousemove _  = unsafeAttribute $ This { key: "mousemove", value:  unset'  }
  unpureAttr OnMousemove eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "mousemove", value:  unset'  }
