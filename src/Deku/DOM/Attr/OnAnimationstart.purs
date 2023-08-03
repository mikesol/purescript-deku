module Deku.DOM.Attr.OnAnimationstart where

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

data OnAnimationstart = OnAnimationstart

instance Attr anything OnAnimationstart (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnAnimationstart bothValues = unsafeAttribute $ Both (pure 
    { key: "animationstart", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "animationstart", value: cb' value })
instance Attr anything OnAnimationstart (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnAnimationstart (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "animationstart", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "animationstart", value: cb' value })
instance Attr anything OnAnimationstart  Cb  where
  attr OnAnimationstart value = unsafeAttribute $ This $ pure $
    { key: "animationstart", value: cb' value }
instance Attr anything OnAnimationstart (Event.Event  Cb ) where
  attr OnAnimationstart eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "animationstart", value: cb' value }

instance Attr anything OnAnimationstart (ST.ST Global.Global  Cb ) where
  attr OnAnimationstart stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "animationstart", value: cb' value }

instance Attr anything OnAnimationstart (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnAnimationstart bothValues = unsafeAttribute $ Both (pure 
    { key: "animationstart"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "animationstart", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnAnimationstart (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnAnimationstart (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "animationstart"
    , value: cb' (Cb (const ((value) $> true)))
    })
    ( Tuple.snd bothValues <#> \value ->
        { key: "animationstart", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnAnimationstart  (Effect Unit)  where
  attr OnAnimationstart value = unsafeAttribute $ This $ pure $
    { key: "animationstart", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnAnimationstart (Event.Event  (Effect Unit) ) where
  attr OnAnimationstart eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "animationstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAnimationstart (ST.ST Global.Global  (Effect Unit) ) where
  attr OnAnimationstart stValue = unsafeAttribute $ This $ stValue
    <#> \value ->
      { key: "animationstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAnimationstart (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnAnimationstart bothValues = unsafeAttribute $ Both (pure 
    { key: "animationstart", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "animationstart", value: cb' (Cb (const value)) }
    )
instance Attr anything OnAnimationstart (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnAnimationstart (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "animationstart", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "animationstart", value: cb' (Cb (const value)) }
    )
instance Attr anything OnAnimationstart  (Effect Boolean)  where
  attr OnAnimationstart value = unsafeAttribute $ This $ pure $
    { key: "animationstart", value: cb' (Cb (const value)) }
instance Attr anything OnAnimationstart (Event.Event  (Effect Boolean) ) where
  attr OnAnimationstart eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "animationstart", value: cb' (Cb (const value)) }

instance Attr anything OnAnimationstart (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnAnimationstart stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "animationstart", value: cb' (Cb (const value)) }

instance Attr everything OnAnimationstart (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnAnimationstart bothValues = unsafeAttribute $ Both (pure 
    { key: "animationstart", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "animationstart", value: unset' })
instance Attr everything OnAnimationstart (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnAnimationstart (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "animationstart", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "animationstart", value: unset' })
instance Attr everything OnAnimationstart  Unit  where
  attr OnAnimationstart _ = unsafeAttribute $ This $ pure $
    { key: "animationstart", value: unset' }
instance Attr everything OnAnimationstart (Event.Event  Unit ) where
  attr OnAnimationstart eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "animationstart", value: unset' }

instance Attr everything OnAnimationstart (ST.ST Global.Global  Unit ) where
  attr OnAnimationstart stValue = unsafeAttribute $ This $ stValue
    <#> \_ -> { key: "animationstart", value: unset' }
