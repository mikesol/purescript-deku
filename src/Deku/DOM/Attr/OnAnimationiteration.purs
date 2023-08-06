module Deku.DOM.Attr.OnAnimationiteration where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnAnimationiteration = OnAnimationiteration

instance Attr anything OnAnimationiteration (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnAnimationiteration bothValues = unsafeAttribute $ Both (pure 
    { key: "animationiteration", value: cb' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "animationiteration", value: cb' value }
    )
instance Attr anything OnAnimationiteration (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnAnimationiteration (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "animationiteration", value: cb' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "animationiteration", value: cb' value }
    )
instance Attr anything OnAnimationiteration  Cb  where
  attr OnAnimationiteration value = unsafeAttribute $ This $ pure $
    { key: "animationiteration", value: cb' value }
instance Attr anything OnAnimationiteration (Event.Event  Cb ) where
  attr OnAnimationiteration eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "animationiteration", value: cb' value }

instance Attr anything OnAnimationiteration (ST.ST Global.Global  Cb ) where
  attr OnAnimationiteration iValue = unsafeAttribute $ This $
    iValue <#> \value -> { key: "animationiteration", value: cb' value }

instance Attr anything OnAnimationiteration (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnAnimationiteration bothValues = unsafeAttribute $ Both (pure 
    { key: "animationiteration"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "animationiteration", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnAnimationiteration (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnAnimationiteration (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "animationiteration"
    , value: cb' (Cb (const ((value) $> true)))
    })
    ( Tuple.snd bothValues <#> \value ->
        { key: "animationiteration", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnAnimationiteration  (Effect Unit)  where
  attr OnAnimationiteration value = unsafeAttribute $ This $ pure $
    { key: "animationiteration", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnAnimationiteration (Event.Event  (Effect Unit) ) where
  attr OnAnimationiteration eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "animationiteration", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAnimationiteration (ST.ST Global.Global  (Effect Unit) ) where
  attr OnAnimationiteration iValue = unsafeAttribute $ This $
    iValue <#> \value ->
      { key: "animationiteration", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAnimationiteration (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnAnimationiteration bothValues = unsafeAttribute $ Both (pure 
    { key: "animationiteration", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "animationiteration", value: cb' (Cb (const value)) }
    )
instance Attr anything OnAnimationiteration (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnAnimationiteration (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "animationiteration", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "animationiteration", value: cb' (Cb (const value)) }
    )
instance Attr anything OnAnimationiteration  (Effect Boolean)  where
  attr OnAnimationiteration value = unsafeAttribute $ This $ pure $
    { key: "animationiteration", value: cb' (Cb (const value)) }
instance Attr anything OnAnimationiteration (Event.Event  (Effect Boolean) ) where
  attr OnAnimationiteration eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "animationiteration", value: cb' (Cb (const value)) }

instance Attr anything OnAnimationiteration (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnAnimationiteration iValue = unsafeAttribute $ This $
    iValue <#> \value ->
      { key: "animationiteration", value: cb' (Cb (const value)) }

instance Attr everything OnAnimationiteration (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnAnimationiteration bothValues = unsafeAttribute $ Both (pure 
    { key: "animationiteration", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "animationiteration", value: unset' })
instance Attr everything OnAnimationiteration (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnAnimationiteration (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "animationiteration", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "animationiteration", value: unset' })
instance Attr everything OnAnimationiteration  Unit  where
  attr OnAnimationiteration _ = unsafeAttribute $ This $ pure $
    { key: "animationiteration", value: unset' }
instance Attr everything OnAnimationiteration (Event.Event  Unit ) where
  attr OnAnimationiteration eventValue = unsafeAttribute $ That $
    eventValue <#> \_ -> { key: "animationiteration", value: unset' }

instance Attr everything OnAnimationiteration (ST.ST Global.Global  Unit ) where
  attr OnAnimationiteration iValue = unsafeAttribute $ This $
    iValue <#> \_ -> { key: "animationiteration", value: unset' }
