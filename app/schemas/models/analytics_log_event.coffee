c = require './../schemas'

AnalyticsLogEventSchema = c.object {
  title: 'Analytics Log Event'
  description: 'Analytics event logs.'
}

_.extend AnalyticsLogEventSchema.properties,
  created: c.date({title: 'Created', readOnly: true})
  user: c.objectId(links: [{rel: 'extra', href: '/db/user/{($)}'}])
  event: {type: 'string'}
  properties: {type: 'object'}

c.extendBasicProperties AnalyticsLogEventSchema, 'analytics.log.event'

module.exports = AnalyticsLogEventSchema
