module Deku.DOM.Attr.OnCanplaythrough where

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

data OnCanplaythrough = OnCanplaythrough

instance Attr anything OnCanplaythrough (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnCanplaythrough bothValues = unsafeAttribute $ Both (pure 
    { key: "canplaythrough", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "canplaythrough", value: cb' value })
instance Attr anything OnCanplaythrough (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnCanplaythrough (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "canplaythrough", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "canplaythrough", value: cb' value })
instance Attr anything OnCanplaythrough  Cb  where
  attr OnCanplaythrough value = unsafeAttribute $ This $ pure $
    { key: "canplaythrough", value: cb' value }
instance Attr anything OnCanplaythrough (Event.Event  Cb ) where
  attr OnCanplaythrough eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "canplaythrough", value: cb' value }

instance Attr anything OnCanplaythrough (ST.ST Global.Global  Cb ) where
  attr OnCanplaythrough stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "canplaythrough", value: cb' value }

instance Attr anything OnCanplaythrough (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnCanplaythrough bothValues = unsafeAttribute $ Both (pure 
    { key: "canplaythrough"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "canplaythrough", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnCanplaythrough (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnCanplaythrough (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "canplaythrough"
    , value: cb' (Cb (const ((value) $> true)))
    })
    ( Tuple.snd bothValues <#> \value ->
        { key: "canplaythrough", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnCanplaythrough  (Effect Unit)  where
  attr OnCanplaythrough value = unsafeAttribute $ This $ pure $
    { key: "canplaythrough", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnCanplaythrough (Event.Event  (Effect Unit) ) where
  attr OnCanplaythrough eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "canplaythrough", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnCanplaythrough (ST.ST Global.Global  (Effect Unit) ) where
  attr OnCanplaythrough stValue = unsafeAttribute $ This $ stValue
    <#> \value ->
      { key: "canplaythrough", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnCanplaythrough (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnCanplaythrough bothValues = unsafeAttribute $ Both (pure 
    { key: "canplaythrough", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "canplaythrough", value: cb' (Cb (const value)) }
    )
instance Attr anything OnCanplaythrough (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnCanplaythrough (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "canplaythrough", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "canplaythrough", value: cb' (Cb (const value)) }
    )
instance Attr anything OnCanplaythrough  (Effect Boolean)  where
  attr OnCanplaythrough value = unsafeAttribute $ This $ pure $
    { key: "canplaythrough", value: cb' (Cb (const value)) }
instance Attr anything OnCanplaythrough (Event.Event  (Effect Boolean) ) where
  attr OnCanplaythrough eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "canplaythrough", value: cb' (Cb (const value)) }

instance Attr anything OnCanplaythrough (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnCanplaythrough stValue = unsafeAttribute $ This $ stValue
    <#> \value -> { key: "canplaythrough", value: cb' (Cb (const value)) }

instance Attr everything OnCanplaythrough (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnCanplaythrough bothValues = unsafeAttribute $ Both (pure 
    { key: "canplaythrough", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "canplaythrough", value: unset' })
instance Attr everything OnCanplaythrough (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnCanplaythrough (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "canplaythrough", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "canplaythrough", value: unset' })
instance Attr everything OnCanplaythrough  Unit  where
  attr OnCanplaythrough _ = unsafeAttribute $ This $ pure $
    { key: "canplaythrough", value: unset' }
instance Attr everything OnCanplaythrough (Event.Event  Unit ) where
  attr OnCanplaythrough eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "canplaythrough", value: unset' }

instance Attr everything OnCanplaythrough (ST.ST Global.Global  Unit ) where
  attr OnCanplaythrough stValue = unsafeAttribute $ This $ stValue
    <#> \_ -> { key: "canplaythrough", value: unset' }
