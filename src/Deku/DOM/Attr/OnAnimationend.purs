module Deku.DOM.Attr.OnAnimationend where

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

data OnAnimationend = OnAnimationend

instance Attr anything OnAnimationend (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnAnimationend bothValues = unsafeAttribute $ Both (pure 
    { key: "animationend", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "animationend", value: cb' value })
instance Attr anything OnAnimationend (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnAnimationend (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "animationend", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "animationend", value: cb' value })
instance Attr anything OnAnimationend  Cb  where
  attr OnAnimationend value = unsafeAttribute $ This $ pure $
    { key: "animationend", value: cb' value }
instance Attr anything OnAnimationend (Event.Event  Cb ) where
  attr OnAnimationend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "animationend", value: cb' value }

instance Attr anything OnAnimationend (ST.ST Global.Global  Cb ) where
  attr OnAnimationend iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "animationend", value: cb' value }

instance Attr anything OnAnimationend (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnAnimationend bothValues = unsafeAttribute $ Both (pure 
    { key: "animationend", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "animationend", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnAnimationend (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnAnimationend (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "animationend", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "animationend", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnAnimationend  (Effect Unit)  where
  attr OnAnimationend value = unsafeAttribute $ This $ pure $
    { key: "animationend", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnAnimationend (Event.Event  (Effect Unit) ) where
  attr OnAnimationend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "animationend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAnimationend (ST.ST Global.Global  (Effect Unit) ) where
  attr OnAnimationend iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "animationend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAnimationend (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnAnimationend bothValues = unsafeAttribute $ Both (pure 
    { key: "animationend", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "animationend", value: cb' (Cb (const value)) }
    )
instance Attr anything OnAnimationend (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnAnimationend (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "animationend", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "animationend", value: cb' (Cb (const value)) }
    )
instance Attr anything OnAnimationend  (Effect Boolean)  where
  attr OnAnimationend value = unsafeAttribute $ This $ pure $
    { key: "animationend", value: cb' (Cb (const value)) }
instance Attr anything OnAnimationend (Event.Event  (Effect Boolean) ) where
  attr OnAnimationend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "animationend", value: cb' (Cb (const value)) }

instance Attr anything OnAnimationend (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnAnimationend iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "animationend", value: cb' (Cb (const value)) }

instance Attr everything OnAnimationend (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnAnimationend bothValues = unsafeAttribute $ Both (pure 
    { key: "animationend", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "animationend", value: unset' })
instance Attr everything OnAnimationend (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnAnimationend (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "animationend", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "animationend", value: unset' })
instance Attr everything OnAnimationend  Unit  where
  attr OnAnimationend _ = unsafeAttribute $ This $ pure $
    { key: "animationend", value: unset' }
instance Attr everything OnAnimationend (Event.Event  Unit ) where
  attr OnAnimationend eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "animationend", value: unset' }

instance Attr everything OnAnimationend (ST.ST Global.Global  Unit ) where
  attr OnAnimationend iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "animationend", value: unset' }
