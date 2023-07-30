module Deku.DOM.Attr.OnKeydown where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnKeydown = OnKeydown

instance Attr anything OnKeydown Cb where
  attr OnKeydown bothValues  = unsafeAttribute $ Both { key: "keydown", value:  cb' (fst bothValues)  } (snd bothValues <#> \value -> { key: "keydown", value:  cb' value  })
  pureAttr OnKeydown value  = unsafeAttribute $ This { key: "keydown", value:  cb' value  }
  unpureAttr OnKeydown eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "keydown", value:  cb' value  }

instance Attr anything OnKeydown (Effect Unit) where
  attr OnKeydown bothValues  = unsafeAttribute $ Both { key: "keydown", value:  cb' (Cb (const ((fst bothValues) $> true)))  } (snd bothValues <#> \value -> { key: "keydown", value:  cb' (Cb (const (value $> true)))  })
  pureAttr OnKeydown value  = unsafeAttribute $ This { key: "keydown", value:  cb' (Cb (const (value $> true)))  }
  unpureAttr OnKeydown eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "keydown", value:  cb' (Cb (const (value $> true)))  }

instance Attr anything OnKeydown (Effect Boolean) where
  attr OnKeydown bothValues  = unsafeAttribute $ Both { key: "keydown", value:  cb' (Cb (const (fst bothValues)))  } (snd bothValues <#> \value -> { key: "keydown", value:  cb' (Cb (const value))  })
  pureAttr OnKeydown value  = unsafeAttribute $ This { key: "keydown", value:  cb' (Cb (const value))  }
  unpureAttr OnKeydown eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "keydown", value:  cb' (Cb (const value))  }

type OnKeydownEffect =
  forall element
   . Attr element OnKeydown (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnKeydown Unit where
  attr OnKeydown bothValues  = unsafeAttribute $ Both { key: "keydown", value:  unset'  } (snd bothValues <#> \_ -> { key: "keydown", value:  unset'  })
  pureAttr OnKeydown _  = unsafeAttribute $ This { key: "keydown", value:  unset'  }
  unpureAttr OnKeydown eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "keydown", value:  unset'  }
