module Deku.DOM.Attr.OnLoad where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnLoad = OnLoad

instance Attr anything OnLoad Cb where
  attr OnLoad bothValues  = unsafeAttribute $ Both { key: "load", value:  cb' (fst bothValues)  } (snd bothValues <#> \value -> { key: "load", value:  cb' value  })
  pureAttr OnLoad value  = unsafeAttribute $ This { key: "load", value:  cb' value  }
  unpureAttr OnLoad eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "load", value:  cb' value  }

instance Attr anything OnLoad (Effect Unit) where
  attr OnLoad bothValues  = unsafeAttribute $ Both { key: "load", value:  cb' (Cb (const ((fst bothValues) $> true)))  } (snd bothValues <#> \value -> { key: "load", value:  cb' (Cb (const (value $> true)))  })
  pureAttr OnLoad value  = unsafeAttribute $ This { key: "load", value:  cb' (Cb (const (value $> true)))  }
  unpureAttr OnLoad eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "load", value:  cb' (Cb (const (value $> true)))  }

instance Attr anything OnLoad (Effect Boolean) where
  attr OnLoad bothValues  = unsafeAttribute $ Both { key: "load", value:  cb' (Cb (const (fst bothValues)))  } (snd bothValues <#> \value -> { key: "load", value:  cb' (Cb (const value))  })
  pureAttr OnLoad value  = unsafeAttribute $ This { key: "load", value:  cb' (Cb (const value))  }
  unpureAttr OnLoad eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "load", value:  cb' (Cb (const value))  }

type OnLoadEffect =
  forall element. Attr element OnLoad (Effect Unit) => Event (Attribute element)

instance Attr everything OnLoad Unit where
  attr OnLoad bothValues  = unsafeAttribute $ Both { key: "load", value:  unset'  } (snd bothValues <#> \_ -> { key: "load", value:  unset'  })
  pureAttr OnLoad _  = unsafeAttribute $ This { key: "load", value:  unset'  }
  unpureAttr OnLoad eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "load", value:  unset'  }
