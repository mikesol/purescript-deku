module Deku.DOM.Attr.OnAnimationiteration where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnAnimationiteration = OnAnimationiteration

instance Attr anything OnAnimationiteration Cb where
  attr OnAnimationiteration bothValues  = unsafeAttribute $ Both { key: "animationiteration", value:  cb' (fst bothValues)  } (snd bothValues <#> \value -> { key: "animationiteration", value:  cb' value  })
  pureAttr OnAnimationiteration value  = unsafeAttribute $ This { key: "animationiteration", value:  cb' value  }
  unpureAttr OnAnimationiteration eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "animationiteration", value:  cb' value  }

instance Attr anything OnAnimationiteration (Effect Unit) where
  attr OnAnimationiteration bothValues  = unsafeAttribute $ Both { key: "animationiteration", value:  cb' (Cb (const ((fst bothValues) $> true)))  } (snd bothValues <#> \value -> { key: "animationiteration", value:  cb' (Cb (const (value $> true)))  })
  pureAttr OnAnimationiteration value  = unsafeAttribute $ This { key: "animationiteration", value:  cb' (Cb (const (value $> true)))  }
  unpureAttr OnAnimationiteration eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "animationiteration", value:  cb' (Cb (const (value $> true)))  }

instance Attr anything OnAnimationiteration (Effect Boolean) where
  attr OnAnimationiteration bothValues  = unsafeAttribute $ Both { key: "animationiteration", value:  cb' (Cb (const (fst bothValues)))  } (snd bothValues <#> \value -> { key: "animationiteration", value:  cb' (Cb (const value))  })
  pureAttr OnAnimationiteration value  = unsafeAttribute $ This { key: "animationiteration", value:  cb' (Cb (const value))  }
  unpureAttr OnAnimationiteration eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "animationiteration", value:  cb' (Cb (const value))  }

type OnAnimationiterationEffect =
  forall element
   . Attr element OnAnimationiteration (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnAnimationiteration Unit where
  attr OnAnimationiteration bothValues  = unsafeAttribute $ Both { key: "animationiteration", value:  unset'  } (snd bothValues <#> \_ -> { key: "animationiteration", value:  unset'  })
  pureAttr OnAnimationiteration _  = unsafeAttribute $ This { key: "animationiteration", value:  unset'  }
  unpureAttr OnAnimationiteration eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "animationiteration", value:  unset'  }
