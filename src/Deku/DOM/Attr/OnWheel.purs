module Deku.DOM.Attr.OnWheel where

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

data OnWheel = OnWheel

instance Attr anything OnWheel (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnWheel bothValues = unsafeAttribute $ Both (pure 
    { key: "wheel", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "wheel", value: cb' value })
instance Attr anything OnWheel (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnWheel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "wheel", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "wheel", value: cb' value })
instance Attr anything OnWheel  Cb  where
  attr OnWheel value = unsafeAttribute $ This $ pure $
    { key: "wheel", value: cb' value }
instance Attr anything OnWheel (Event.Event  Cb ) where
  attr OnWheel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "wheel", value: cb' value }

instance Attr anything OnWheel (ST.ST Global.Global  Cb ) where
  attr OnWheel stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "wheel", value: cb' value }

instance Attr anything OnWheel (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnWheel bothValues = unsafeAttribute $ Both (pure 
    { key: "wheel", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "wheel", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnWheel (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnWheel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "wheel", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "wheel", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnWheel  (Effect Unit)  where
  attr OnWheel value = unsafeAttribute $ This $ pure $
    { key: "wheel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnWheel (Event.Event  (Effect Unit) ) where
  attr OnWheel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "wheel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnWheel (ST.ST Global.Global  (Effect Unit) ) where
  attr OnWheel stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "wheel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnWheel (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnWheel bothValues = unsafeAttribute $ Both (pure 
    { key: "wheel", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "wheel", value: cb' (Cb (const value)) }
    )
instance Attr anything OnWheel (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnWheel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "wheel", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "wheel", value: cb' (Cb (const value)) }
    )
instance Attr anything OnWheel  (Effect Boolean)  where
  attr OnWheel value = unsafeAttribute $ This $ pure $
    { key: "wheel", value: cb' (Cb (const value)) }
instance Attr anything OnWheel (Event.Event  (Effect Boolean) ) where
  attr OnWheel eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "wheel", value: cb' (Cb (const value)) }

instance Attr anything OnWheel (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnWheel stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "wheel", value: cb' (Cb (const value)) }

instance Attr everything OnWheel (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnWheel bothValues = unsafeAttribute $ Both (pure 
    { key: "wheel", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "wheel", value: unset' })
instance Attr everything OnWheel (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnWheel (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "wheel", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "wheel", value: unset' })
instance Attr everything OnWheel  Unit  where
  attr OnWheel _ = unsafeAttribute $ This $ pure $ { key: "wheel", value: unset' }
instance Attr everything OnWheel (Event.Event  Unit ) where
  attr OnWheel eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "wheel", value: unset' }

instance Attr everything OnWheel (ST.ST Global.Global  Unit ) where
  attr OnWheel stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "wheel", value: unset' }
